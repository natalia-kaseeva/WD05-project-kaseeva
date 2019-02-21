<?php

$title = "Магазин - удалить заказ";

if ( !isLoggedIn() ) {
    header("Location: " . HOST);
    die();
}

$orderId = intval($_GET['id']);
$order = R::findOne( 'orders', 'id = '.$orderId );

if(!isAdmin()) { 
    header('Location: ' . HOST);
    die();
}

if(isset($_POST['orderDelete'])) {

    R::trash($order);
    header('Location: ' . HOST . 'orders?result=ordersDeleted');
    exit();
}
   
    //Подготавливаем конетнт для центральной части
    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/orders/order-delete.tpl');
    $content = ob_get_contents();
    ob_end_clean();


    //Подключаем основные шаблоны
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include(ROOT . 'templates/_parts/_foot.tpl');
?>