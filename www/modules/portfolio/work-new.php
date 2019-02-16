<?php

if (!isAdmin()) {
	header("Location: " . HOST);
	die;
}

$title = "Порфолио - добавить  работу";

if(isset($_POST['add-work'])){

	if (trim($_POST['title']) == '') {
		$errors[] = ['title' => 'Введите название работы'];
	}

	if (trim($_POST['text']) == '') {
		$errors[] = ['title' => 'Введите содержание'];
	}

	 if (isset($_FILES['workImg']['name']) && $_FILES['workImg']['tmp_name'] != '') {

    //Запишем параметры картинки в переменные
    $fileName = $_FILES['workImg']['name'];//имя файла(с расширением)
    $fileTmpLoc = $_FILES['workImg']['tmp_name'];//где файл временно размещён
    $fileType = $_FILES['workImg']['type'];
    $fileSize = $_FILES['workImg']['size'];
    $fileErrorMsg = $_FILES['workImg']['error'];
    
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

	if (empty($errors)) {
		$work = R::dispense('works');
		
		$work->title = htmlentities($_POST['title']);
		$work->text = $_POST['text'];
		$work->result = $_POST['result'];
		$work->technologies = $_POST['technologies'];
		$work->project = htmlentities($_POST['project']);
		$work->github = htmlentities($_POST['github']);
		$work->authorId = $_SESSION['logged_user']['id'];
		$work->date_time = R::isoDateTime();
		
		//Загрузка изображение для поста
        if(isset($_FILES['workImg']['name']) && $_FILES['workImg']['tmp_name'] != '') {
            //write file image params in variables
            $fileName = $_FILES['workImg']['name'];
            $fileTmpLoc = $_FILES['workImg']['tmp_name'];
            $fileType = $_FILES['workImg']['type'];
            $fileSize = $_FILES['workImg']['size'];
            $fileErrorMsg = $_FILES['workImg']['error'];
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
            $workImgFolderLocation = ROOT . 'usercontent/portfolio/';
            $uploadFile = $workImgFolderLocation . $db_file_name;
            $moveResult = move_uploaded_file($fileTmpLoc, $uploadFile);
            if($moveResult != true) {
                $errors[] = ['title' => 'Ошибка сохранения файла'];
            }
            include_once(ROOT . 'libs/image_resize_imagick.php');

            //Устаналиваем размеры для большой картинки блога
            $target_file = $workImgFolderLocation . $db_file_name;
            $wmax = 920;
            $hmax = 620;
            $img = createThumbnailBig($target_file, $wmax, $hmax);
            $img->writeImage($target_file);
            $work->workImg = $db_file_name;
            //Устаналиваем размеры для малой картинки, которая будет отображаться в карточке
            $target_file = $workImgFolderLocation . $db_file_name;
            $resized_file = $workImgFolderLocation . '320-' . $db_file_name;
            $wmax = 360;
            $hmax = 190;
            $img = createThumbnailCrop($target_file, $wmax, $hmax);
            $img->writeImage($resized_file);
            $work->workImgSmall = '320-' . $db_file_name;
        }

        R::store($work);
        header('Location: ' . HOST . 'portfolio?result=workCreated');
        exit();
    }
}

// Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/portfolio/work-new.tpl";
$content = ob_get_contents();

// Выводим шаблоны
ob_end_clean();
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>