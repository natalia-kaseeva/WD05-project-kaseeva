<?php

if(!isAdmin()) { 
    header('Location: ' . HOST);
    die();
}
    
$title = 'Блог - добавить пост';

$categories = R::find('categories', 'ORDER BY cat_title ASC');

if(isset($_POST['add-post'])) {
    if(trim($_POST['post-title']) == '') {
        $errors[] = ['title' => 'Введите заголовок поста!'];
    }

    if(trim($_POST['post-text']) == '') {
        $errors[] = ['title' => 'Введите текст поста!'];
    }

    if (isset($_FILES['post-image']['name']) && $_FILES['post-image']['tmp_name'] != '') {

    //Запишем параметры картинки в переменные
    $fileName = $_FILES['post-image']['name'];//имя файла(с расширением)
    $fileTmpLoc = $_FILES['post-image']['tmp_name'];//где файл временно размещён
    $fileType = $_FILES['post-image']['type'];
    $fileSize = $_FILES['post-image']['size'];
    $fileErrorMsg = $_FILES['post-image']['error'];
    
    if (@getimagesize($fileTmpLoc)) {
        list($width, $height) = getimagesize($fileTmpLoc);
        if ($width < 10 || $height < 10) {
            $errors[] = ['title' =>'Изображение не имеет размеров. Загрузите изображение побольше' ];
        }
    } 

    if ($fileSize > 4194304) {
        $errors[] = ['title' =>'Файл изображения не болжен быть более 4 Mb' ];
    }
    if (!preg_match("/\.(gif|jpg|png|jpeg)$/i", $fileName)) {
        $errors[] = ['title' => 'Неверный формат файла', 'desc' => 'Файл изображения должен быть в формате gif, jpg, png или jpeg'];
    }
    if ($fileErrorMsg == 1) {
        $errors[] = ['title' =>'При загрузке изображения произошла ошибка. Повторите попытку' ];
    }

}

    if(empty($errors)) {
        $post = R::dispense('posts');
        $post->title = htmlentities($_POST['post-title']);
        $post->text = $_POST['post-text'];
        $post->dataTime = R::isoDateTime();
        $post->authorId = $_SESSION['logged_user']['id'];

        if (isset($_POST['postCat']) != '') {
            $post->cat = htmlentities($_POST['postCat']);
        }

        //Загрузка изображение для поста
        if(isset($_FILES['post-image']['name']) && $_FILES['post-image']['tmp_name'] != '') {
            //write file image params in variables
            $fileName = $_FILES['post-image']['name'];
            $fileTmpLoc = $_FILES['post-image']['tmp_name'];
            $fileType = $_FILES['post-image']['type'];
            $fileSize = $_FILES['post-image']['size'];
            $fileErrorMsg = $_FILES['post-image']['error'];
            $kaboom = explode('.', $fileName);
            $fileExt = end($kaboom);

            list($width, $height) = getimagesize($fileTmpLoc);
            if($width < 10 || $height < 10) {
                $errors[] = ['title' => 'Изображение не имеет размеров.', 'desc
                ' => 'Загрузите изображение с большим разрешением'];
            }
            if($fileSize > 4194304) {
                $errors[] = ['title' => 'Размер файла с изображением не должен превышать 4Mb'];
            }
            if(!preg_match('/\.(gif|png|jpg|jpeg)$/i', $fileName)) {
                $errors[] = ['title' => 'Неверный формат файла.', 'desc' => 'Файл изображения должен быть в формате jpg, png или gif'];
            }
            if($fileErrorMsg == 1) {
                $errors[] = ['title' => 'При загрузке изображения произошла ошибка'];
            }

            //Перемещаем загруженный фал в нужную директорию
            $db_file_name = rand(100000000, 999999999) . '.' . $fileExt;
            $postImgFolderLocation = ROOT . 'usercontent/blog/';
            $uploadFile = $postImgFolderLocation . $db_file_name;
            $moveResult = move_uploaded_file($fileTmpLoc, $uploadFile);
            if($moveResult != true) {
                $errors[] = ['title' => 'Ошибка сохранения файла'];
            }
            include_once(ROOT . 'libs/image_resize_imagick.php');
            
            //Устаналиваем размеры для большой картинки блога
            $target_file = $postImgFolderLocation . $db_file_name;
            $wmax = 920;
            $hmax = 620;
            $img = createThumbnailBig($target_file, $wmax, $hmax);
            $img->writeImage($target_file);
            $post->postImg = $db_file_name;
            //Устаналиваем размеры для малой картинки, которая будет отображаться в карточке
            $target_file = $postImgFolderLocation . $db_file_name;
            $resized_file = $postImgFolderLocation . '320-' . $db_file_name;
            $wmax = 320;
            $hmax = 140;
            $img = createThumbnailCrop($target_file, $wmax, $hmax);
            $img->writeImage($resized_file);
            $post->postImgSmall = '320-' . $db_file_name;
        }
        R::store($post);
        header('Location: ' . HOST . 'blog?result=postCreated');
        exit();
    }
}
    
    // Готовим контент для центральной части
    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/blog/post-new.tpl');
    $content = ob_get_contents();
    ob_end_clean();
    
    // Выводим шаблоны
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot.tpl');
