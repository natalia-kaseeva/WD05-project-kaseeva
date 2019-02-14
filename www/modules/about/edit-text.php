<?php

if(!isAdmin()) { 
    header('Location: ' . HOST);
    die();
}

$title = 'Редактировать - О авторе';

$about = R::load('about', 1);


if(isset($_POST['textUpdate'])) {
    if(trim($_POST['firstname']) == '') {
        $errors[] = ['title' => 'Введите имя'];
    }
    if(trim($_POST['lastname']) == '') {
        $errors[] = ['title' => 'Введите фамилию'];
    }
    if(trim($_POST['description']) == '') {
        $errors[] = ['title' => 'Введите информацию о себе'];
    }

    if(isset($_FILES['photo']['name']) && $_FILES['photo']['tmp_name'] != '') {
            $fileName = $_FILES['photo']['name'];
            $fileTmpLoc = $_FILES['photo']['tmp_name'];
            $fileType = $_FILES['photo']['type'];
            $fileSize = $_FILES['photo']['size'];
            $fileErrorMsg = $_FILES['photo']['error'];
            $kaboom = explode('.', $fileName);
            $fileExt = end($kaboom);
            list($width, $height) = getimagesize($fileTmpLoc);
       
            if($fileSize > 4194304 ) {
                $errors[] = ['title' => 'Размер изображения не должен превышать 4Mb'];
            }

            if(!preg_match('/\.(gif|png|jpg|jpeg)$/i', $fileName)) {
                $errors[] = ['title' => 'Неверный формат файла!', 'desc' => '<p>Файл изображения должен быть в формате jpg, png, gif.<p>'];
            } else if ($width < 10 || $height < 10 ) {
                $errors[] = ['title' => 'Изображение не имеет размеров!', 'desc' => '<p>Загрузите изображение с большим разрешением</p>'];
            }

            if($fileErrorMsg == 1) {
                $errors[] = ['title' => 'При загрузке изображения произошла ошибка'];
            }
        }

    if(empty($errors)) {
        $about->firstname = htmlentities($_POST['firstname']);
        $about->lastname = htmlentities($_POST['lastname']);
        $about->description = $_POST['description'];

        if(isset($_FILES['photo']['name']) && $_FILES['photo']['tmp_name'] != '') {
            $fileName = $_FILES['photo']['name'];
            $fileTmpLoc = $_FILES['photo']['tmp_name'];
            $fileType = $_FILES['photo']['type'];
            $fileSize = $_FILES['photo']['size'];
            $fileErrorMsg = $_FILES['photo']['error'];
            $kaboom = explode('.', $fileName);
            $fileExt = end($kaboom);
            list($width, $height) = getimagesize($fileTmpLoc);
            if($width < 10 || $height < 10) {
                $errors[] = ['title' => 'Изображение не имеет размеров.', 'description' => '<p>Загрузите изображение с большим разрешением.</p>'];
            }

            if($fileSize > 4194304 ) {
                $errors[] = ['title' => 'Размер изображения не должен превышать 4Mb.'];
            }
            if(!preg_match('/\.(gif|png|jpg|jpeg)$/i', $fileName)) {
                $errors[] = ['title' => 'Неверный формат файла.', 'description' => '<p>Файл изображения должен быть в формате jpg, png, gif.<p>'];
            }

            if($fileErrorMsg == 1) {
                $errors[] = ['title' => 'При загрузке изображения произошла ошибка.'];
            }

            //Проверяем установлено ли изображение у поста
            $aboutImg = $about['photo'];
            $aboutImgFolderLocation = ROOT . 'usercontent/about/';
            if($aboutImg != "") {
                $picurl = $aboutImgFolderLocation . $aboutImg;
                if(file_exists($picurl)) { unlink($picurl);}
            }

            //Перемещаем загруженный файл в нужную директорию
            $db_file_name = rand(1000000000, 9999999999) . '.' . $fileExt;
            $uploadFile = $aboutImgFolderLocation . $db_file_name;
            $moveResult = move_uploaded_file($fileTmpLoc, $uploadFile);
            if($moveResult != true) {
                $errors[] = ['title' => 'Ошибка сохранения файла.'];
            }
            include_once(ROOT . 'libs/image_resize_imagick.php');
            $target_file = $aboutImgFolderLocation . $db_file_name;
            $wmax = 222;
            $hmax = 222;
            $img = createThumbnail($target_file, $wmax, $hmax);
            $img->writeImage($target_file);
            $about->photo = $db_file_name;
        }

        R::store($about);
        header('Location: ' . HOST . 'about?result=textUpdated');
        exit();
    }
}

//Подготаливаем контент для центральной части
ob_start();
include(ROOT . 'templates/_parts/_header.tpl');
include(ROOT . 'templates/about/edit-text.tpl');
$content = ob_get_contents();
ob_end_clean();

//Подключаем основные шаблоны
include(ROOT . 'templates/_parts/_head.tpl');
include(ROOT . 'templates/template.tpl');
include(ROOT . 'templates/_parts/_footer.tpl');
include(ROOT . 'templates/_parts/_foot.tpl');
?>