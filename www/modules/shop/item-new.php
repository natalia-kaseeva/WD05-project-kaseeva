<?php 

if ( !isAdmin() ) {
	header("Location: " . HOST);
	die();
}

$title = "Магазин - Создать новый товар";

if ( isset($_POST['itemNew']) ) {
	
	if ( trim($_POST['title']) == '') {
		$errors[] = ['title' => 'Введите Название товара' ];
	}

	if ( trim($_POST['price']) == '') {
		$errors[] = ['title' => 'Введите Стоимость товара' ];
	}

	if ( isset($_FILES["itemImg"]["name"]) && $_FILES["itemImg"]["tmp_name"] != "" ) {

		// Write file image params in variables
		$fileName = $_FILES["itemImg"]["name"];
		$fileTmpLoc = $_FILES["itemImg"]["tmp_name"];
		$fileType = $_FILES["itemImg"]["type"];
		$fileSize = $_FILES["itemImg"]["size"];
		$fileErrorMsg = $_FILES["itemImg"]["error"];
		$kaboom = explode(".", $fileName);
		$fileExt = end($kaboom);

		// Check file propertties on different conditions
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

	if ( empty($errors)) {
		$item = R::dispense('goods');

		$item->title = htmlentities($_POST['title']);
		$item->price = htmlentities($_POST['price']);
		$item->priceOld = htmlentities($_POST['priceOld']);
		$item->desc = $_POST['itemDesc'];

		if ( isset($_FILES["itemImg"]["name"]) && $_FILES["itemImg"]["tmp_name"] != "" ) {

			// Write file image params in variables
			$fileName = $_FILES["itemImg"]["name"];
			$fileTmpLoc = $_FILES["itemImg"]["tmp_name"];
			$fileType = $_FILES["itemImg"]["type"];
			$fileSize = $_FILES["itemImg"]["size"];
			$fileErrorMsg = $_FILES["itemImg"]["error"];
			$kaboom = explode(".", $fileName);
			$fileExt = end($kaboom);

			// Check file propertties on different conditions
			list($width, $height) = getimagesize($fileTmpLoc);
			if($width < 10 || $height < 10){
				$errors[] = ['title' => 'Изображение не имеет размеров. Загрузите изображение побольше.' ];
			}

			if ( $fileSize > 4194304 ) {
				$errors[] = ['title' => 'Файл изображения не должен быть более 4 Mb' ];
			}

			if ( !preg_match("/\.(gif|jpg|jpeg|png)$/i", $fileName) ) {
				$errors[]  = [ 'title' => 'Неверный формат файла', 'desc' => '<p>Файл изображения должен быть в формате gif, jpg, jpeg, или png.</p>', ];
			}

			if ( $fileErrorMsg == 1 ) {
				$errors[] = ['title' => 'При загрузке изображения произошла ошибка. Повторите попытку' ];
			}

			// Перемещаем загруженный файл в нужную директорию
			$db_file_name = rand(100000000000,999999999999) . "." . $fileExt;
			$postImgFolderLocation = ROOT . 'usercontent/shop/';
			$uploadfile = $postImgFolderLocation . $db_file_name;
			$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

			if ($moveResult != true) {
				$errors[] = ['title' => 'Ошибка сохранения файла' ];
			}

			include_once( ROOT . "/libs/image_resize_imagick.php");

			$target_file =  $postImgFolderLocation . $db_file_name;
			$wmax = 920;
			$hmax = 620;
			$img = createThumbnailCropNew($target_file, $wmax, $hmax);
			$img->writeImage($target_file);
			$item->img = $db_file_name;

			$target_file =  $postImgFolderLocation . $db_file_name;
			$resized_file = $postImgFolderLocation . "320-" . $db_file_name;
			$wmax = 320;
			$hmax = 140;
			$img = createThumbnailCropNew($target_file, $wmax, $hmax);
			$img->writeImage($resized_file);
			$item->imgSmall = "320-" . $db_file_name;

		}

		R::store($item);
		header('Location: ' . HOST . "shop?result=itemCreated");
		exit();

	}
}

// Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/shop/item-new.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>
