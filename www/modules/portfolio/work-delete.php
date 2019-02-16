<?php

if (!isAdmin()) {
	header("Location: " . HOST);
	die;
}

$title = "Портфолио - Удалить работу";

$work = R::load('works', $_GET['id']);

if(isset($_POST['workDelete'])) {
    $workImage = $work['work_img'];
    $workImageLocation = ROOT . 'usercontent/portfolio/';
    if($workImage != '') {
        $pictureImgurl = $workImageLocation . $workImage;
        if(file_exists($pictureImgurl)) {unlink($pictureImgurl);}
        $pictureImgurl320 = $workImageLocation . '320-' . $workImage;
        if(file_exists($pictureImgurl320)) {unlink($pictureImgurl320);}
    }

    R::trash($work);
    header('Location: ' . HOST . 'portfolio?result=workDeleted');
    exit();
}

//Подготавливаем конетнт для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/portfolio/work-delete.tpl";
$content = ob_get_contents();
ob_end_clean();

//Подключаем основные шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";
?>