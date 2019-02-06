<?php

if(!isAdmin()) { 
    header('Location: ' . HOST);
    die();
}

$title = 'Категории - редактировать категорию.';

$category = R::load('categories', $_GET['id']);

if(isset($_POST['catEdit'])) {
    if(trim($_POST['catTitle']) == '') {
        $errors[] = ['title' => 'Введите название категории'];
    }
    if(R::count('categories', 'cat_title=?', array($_POST['catTitle']))) {
        $errors[] = ['title' => 'Такая  категория уже существует'];
    }
    if(empty($errors)) {
        $category->cat_title = htmlentities($_POST['catTitle']);
        R::store($category);
        header('Location: ' . HOST . 'blog/categories?result=catUpdated');
        exit();
    }
}

//Подготавливаем конетнт для центральной части
ob_start();
include(ROOT . 'templates/_parts/_header.tpl');
include(ROOT . 'templates/categories/edit.tpl');
$content = ob_get_contents();
ob_end_clean();

//Подключаем основные шаблоны
include(ROOT . 'templates/_parts/_head.tpl');
include(ROOT . 'templates/template.tpl');
include(ROOT . 'templates/_parts/_footer.tpl');
include(ROOT . 'templates/_parts/_foot.tpl');
?>