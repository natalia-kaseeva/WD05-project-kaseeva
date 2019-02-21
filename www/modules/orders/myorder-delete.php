<?php

$title = "Магазин - удалить заказ";

if ( !isLoggedIn() ) {
    header("Location: " . HOST);
    die();
}

$orderId = intval($_GET['id']);
$order = R::findOne( 'orders', 'id = '.$orderId );

if ( $order->user_id != $_SESSION['logged_user']['id']  ) {
    header("Location: " . HOST);
    die();
}

if(isset($_POST['myorderDelete'])) {

    R::trash($order);
    header('Location: ' . HOST . 'myorders?result=myordersDeleted');
    exit();
}
   
    //Подготавливаем конетнт для центральной части
    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/orders/myorder-delete.tpl');
    $content = ob_get_contents();
    ob_end_clean();


    //Подключаем основные шаблоны
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot.tpl');
?>