<?php

if(!isAdmin()) { 
    header('Location: ' . HOST);
    die();
}

$title = 'Категории - добавить категорию';

if(isset($_POST['catNew'])) {
    if(trim($_POST['catTitle']) == '') {
        $errors[] = ['title' => 'Введите название категории'];
    }

    if(R::count('categories', 'cat_title=?', array($_POST['catTitle'])) > 0) {
        $errors[] = ['title' => 'Такая категория уже существует'];
    }

    if(empty($errors)) {
        $cat = R::dispense('categories');
        $cat->catTitle = htmlentities($_POST['catTitle']);
        R::store($cat);
        header('Location: ' . HOST . 'blog/categories?result=catCreated');
        exit();
    }
}

//Подготавливаем контент для центральной части
ob_start();
include(ROOT . 'templates/_parts/_header.tpl');
include(ROOT . 'templates/categories/new.tpl');
$content = ob_get_contents();

ob_end_clean();
//Подключаем основные шаблоны
include(ROOT . 'templates/_parts/_head.tpl');
include(ROOT . 'templates/template.tpl');
include(ROOT . 'templates/_parts/_footer.tpl');
include(ROOT . 'templates/_parts/_foot.tpl');
?>