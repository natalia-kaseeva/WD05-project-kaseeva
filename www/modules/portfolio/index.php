<?php

$title = "Портфолио -  все работы";

$works = R::find('works', 'ORDER BY id DESC');


// Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/portfolio/all-works.tpl";
$content = ob_get_contents();

// Выводим шаблоны
ob_end_clean();
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";
?>