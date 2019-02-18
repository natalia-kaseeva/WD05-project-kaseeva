<?php
if (!isAdmin()) {
	header("Location: " . HOST);
	die;
}
$title = "Портфолио - Редактировать работу";

$work = R::load('works', $_GET['id']);

if(isset($_POST['workUpdate'])){

	if (trim($_POST['title']) == '') {
		$errors[] = ['title' => 'Введите название работы'];
	}

	if (trim($_POST['text']) == '') {
		$errors[] = ['title' => 'Введите содержание'];
	}

	if (isset($_FILES['workimg']['name']) && $_FILES['workimg']['tmp_name'] != '') {

    //Запишем параметры картинки в переменные
    $fileName = $_FILES['workimg']['name'];//имя файла(с расширением)
    $fileTmpLoc = $_FILES['workimg']['tmp_name'];//где файл временно размещён
    $fileType = $_FILES['workimg']['type'];
    $fileSize = $_FILES['workimg']['size'];
    $fileErrorMsg = $_FILES['workimg']['error'];
    if (@getimagesize($fileTmpLoc)) {
        list($width, $height) = getimagesize($fileTmpLoc);
        if ($width < 10 || $height < 10) {
            $errors[] = ['title' =>'Изображение не имеет размеров. Загрузите изображение побольше' ];
        }
    } /*else {
        $errors[] = ['title' =>'При загрузке изображения произошла ошибка' ];
    }*/

    if ($fileSize > 4194304) {
        $errors[] = ['title' =>'Файл изображения не болжен быть более 4 Mb' ];
    }
    if (!preg_match("/\.(gif|jpg|png|jpeg)$/i", $fileName)) {
        $errors[] = ['title' => 'Неверный формат файла', 'desc' => '<p>Файл изображения должен быть в формате gif, jpg, png или jpeg</p>'];
    }
    if ($fileErrorMsg == 1) {
        $errors[] = ['title' =>'При загрузке изображения произошла ошибка. Повторите попытку' ];
    }

}

    if(empty($errors)) {
       $work->title = htmlentities($_POST['title']);
		$work->text = $_POST['text'];
		$work->result = $_POST['result'];
		$work->technologies = $_POST['technologies'];
		$work->project = htmlentities($_POST['project']);
		$work->github = htmlentities($_POST['github']);
		$work->authorId = $_SESSION['logged_user']['id'];
		$work->updateTime = R::isoDateTime();

        //Загрузка изображение для поста
        if(isset($_FILES['workimg']['name']) && $_FILES['workimg']['tmp_name'] != '') {
            //write file image params in variables
            $fileName = $_FILES['workimg']['name'];
            $fileTmpLoc = $_FILES['workimg']['tmp_name'];
            $fileType = $_FILES['workimg']['type'];
            $fileSize = $_FILES['workimg']['size'];
            $fileErrorMsg = $_FILES['workimg']['error'];
            $kaboom = explode('.', $fileName);
            $fileExt = end($kaboom);

            list($width, $height) = getimagesize($fileTmpLoc);
            if($width < 10 || $height < 10) {
                $errors[] = ['title' => 'Изображение не имеет размеров.', 'desc
                ' => 'Загрузите изображение с большим разрешением.'];
            }
            if($fileSize > 10485760) {
                $errors[] = ['title' => 'Размер файла с изображением не должен превышать 10Mb.'];
            }
            if(!preg_match('/\.(gif|png|jpg|jpeg)$/i', $fileName)) {
                $errors[] = ['title' => 'Неверный формат файла.', 'desc' => 'Файл изображения должен быть в формате jpg, png или gif.'];
            }
            if($fileErrorMsg == 1) {
                $errors[] = ['title' => 'При загрузке изображения произошла ошибка.'];
            }

            //Перемещаем загруженный фал в нужную директорию
            $db_file_name = rand(100000000, 999999999) . '.' . $fileExt;
            $workImgFolderLocation = ROOT . 'usercontent/portfolio/';
            $uploadFile = $workImgFolderLocation . $db_file_name;
            $moveResult = move_uploaded_file($fileTmpLoc, $uploadFile);

            // Если картинка поста  уже установлена, то удаляем файл
            $workImg = $work->work_img;
            if ( $workImg != "" ) {
                $picurl = $workImgFolderLocation . $workImg;
                // Удаляем аватар
                // die($picurl); 
                if ( file_exists($picurl) ) { unlink($picurl); }
                $picurl320 = $workImgFolderLocation . '320-' . $workImg;
                if ( file_exists($picurl320) ) { unlink($picurl320); }
            }

        if ($moveResult != true) {
            $errors[] = ['title' => 'Ошибка сохранения файла' ];
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
        header('Location: ' . HOST . 'portfolio?result=workUpdated');
        exit();
    }
}

// Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/portfolio/work-edit.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";
?>