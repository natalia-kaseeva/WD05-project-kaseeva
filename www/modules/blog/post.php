<?php

 $sql = 'SELECT 
        posts.id,posts.title,posts.text,posts.data_time,posts.update_time,posts.post_img,posts.author_id,posts.cat,
        users.username,users.lastname,
        categories.cat_title
        FROM `posts`
        LEFT JOIN categories ON  posts.cat=categories.id
        INNER JOIN users ON  posts.author_id=users.id
        WHERE posts.id =' . $_GET['id'] . ' LIMIT 1';
   
    $post = R::getAll($sql);
    $post = $post[0];

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