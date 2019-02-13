<?php

if(!isAdmin()) { 
    header('Location: ' . HOST);
    die();
}

$title = 'Редактировать - О авторе';

$skills = R::load('skills', 1);

if(isset($_POST['skillsUpdate'])) {

    foreach($_POST as $index => $skill) {
        if(intval($_POST[$index]) > 100) { 
            $errors[] = ["title" => "Для поля $index введите число от 0 до 100"];
        }
    }

    if(empty($errors)) {
        $skills->html = htmlentities(intval($_POST['html']));
        $skills->css = htmlentities(intval($_POST['css']));
        $skills->js = htmlentities(intval($_POST['js']));
        $skills->jquery = htmlentities(intval($_POST['jquery']));
        $skills->php = htmlentities(intval($_POST['php']));
        $skills->mysql = htmlentities(intval($_POST['mysql']));
        $skills->git = htmlentities(intval($_POST['git']));
        $skills->gulp = htmlentities(intval($_POST['gulp']));
        $skills->npm = htmlentities(intval($_POST['npm']));
        $skills->yarn = htmlentities(intval($_POST['yarn']));

        R::store($skills);
        header('Location: ' . HOST . 'about');
        exit();
    }
}

//Подготавливаем контент для центарльной части
ob_start();
include(ROOT . 'templates/_parts/_header.tpl');
include(ROOT . 'templates/about/edit-skills.tpl');
$content = ob_get_contents();
ob_end_clean();
//Подключаем основные шаблоны
include(ROOT . 'templates/_parts/_head.tpl');
include(ROOT . 'templates/template.tpl');
include(ROOT . 'templates/_parts/_footer.tpl');
include(ROOT . 'templates/_parts/_foot.tpl');

?>