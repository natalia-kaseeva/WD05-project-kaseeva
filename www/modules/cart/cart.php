<?php 

$title = "Корзина - Магазин";

/*
	Корзину формируем на основе корзины в Cookies
	Но, в Cookies лежат только ID и КОЛ-ВО товаров. 
	Поэтому делаем запрос в БД, чтобы получить картинки и названия товаров.
*/
if (isset($_COOKIE['cart'])) {
	$cookieCartArray = json_decode($_COOKIE['cart'], true);

	// Запрашиваем Cookie
	if ( count( $cookieCartArray ) > 0 ) {
		$cartItems = array();
		foreach ( $cookieCartArray as $key => $value) {
			$cartItems[] = $key; // [1, 5, 10]
		}

		// На основе Cookie отправляем запрос в БД на товрары в корзине
		$cartGoods = R::findLike('goods', [
		   // 'id' => ['10', '11']
		    'id' => $cartItems
		], ' ORDER BY id ASC ');

	} else {
		$cartGoods = array();
	}
}

$cartItemsArray = json_decode($_COOKIE['cart'], true);

$cartGoodsCount = 0;
$cartGoodsCount = array_sum($cartItemsArray);

$cartGoodsTotalPrice = 0;
foreach ($cartGoods as $item) {
	$cartGoodsTotalPrice += $cartItemsArray[$item->id ] * $item->price;
}

// Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/cart/cart.tpl";
$content = ob_get_contents();
ob_end_clean();

// Выводим шаблоны
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";

?>