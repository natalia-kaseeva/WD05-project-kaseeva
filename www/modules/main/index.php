<?php 

$details = R::find('about', 1);
//print_r($details);

$aboutName =  $details[1]['name'];
$aboutDescription = $details[1]['description'];

/*echo $aboutName;
echo $aboutDescription;*/

$title = "Главная";
$content ="Содержимое главной страницы";

// Готовим контент для центральной части
ob_start();
include ROOT . "templates/main/main.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";

 ?>