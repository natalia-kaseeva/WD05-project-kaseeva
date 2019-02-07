<?php

 $sqlPost = 'SELECT 
        posts.id,posts.title,posts.text,posts.data_time,posts.update_time,posts.post_img,posts.author_id,posts.cat,
        users.username,users.lastname,
        categories.cat_title
        FROM `posts`
        LEFT JOIN categories ON  posts.cat=categories.id
        INNER JOIN users ON  posts.author_id=users.id
        WHERE posts.id =' . $_GET['id'] . ' LIMIT 1';
   
    $post = R::getAll($sqlPost);
    $post = $post[0];

$sqlComments = "SELECT 
        users.username, users.lastname, users.avatar_small,
        comments.user_id, comments.text, comments.date_time
    FROM `comments`
    INNER JOIN users ON users.id = comments.user_id
    WHERE comments.post_id =" . $_GET['id'];

$comments = R::getAll($sqlComments);

if(isset($_POST['addComment'])) {
    if(trim($_POST['comment-user']) == '') {
        $errors[] = ['title' => 'Введите текст комментария!'];
    }
    if(empty($errors)) {
        $comment = R::dispense('comments');
        $comment->postId = htmlentities($_GET['id']);
        $comment->userId = htmlentities($_SESSION['logged_user']['id']);
        $comment->text = htmlentities($_POST['comment-user']);
        $comment->dateTime = R::isoDateTime();
        R::store($comment);
        $comments=R::getAll($sqlComments);
        /*header('Location: ' . HOST . 'blog/post?id=' . $_GET['id']);
        exit();*/
    }
}

$title = $post['title'];

//Подготавливаем контент для центральной части
ob_start();
include(ROOT . 'templates/_parts/_header.tpl');
include(ROOT . 'templates/blog/post.tpl');
$content = ob_get_contents();
ob_end_clean();

//Подключаем основные шаблоны
include(ROOT . 'templates/_parts/_head.tpl');
include(ROOT . 'templates/template.tpl');
include(ROOT . 'templates/_parts/_footer.tpl');
include(ROOT . 'templates/_parts/_foot.tpl');
?>
