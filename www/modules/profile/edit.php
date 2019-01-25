<?php 
 $title = "Редактировать профиль";

$currentUser = $_SESSION['logged_user'];
$user = R::load('users', $currentUser->id);

if ( isset($_POST['save-profile']) ) {

	if ( trim($_POST['useremail']) == '') {
		$errors[] = ['title' => 'Введите Email' ];
	}

	if ( trim($_POST['username']) == '') {
		$errors[] = ['title' => 'Введите Имя' ];
	}

	if ( trim($_POST['lastname']) == '') {
		$errors[] = ['title' => 'Введите Фамилию' ];
	}

	if ( empty($errors)	) {
		$user->username = htmlentities($_POST['username']);
		$user->lastname = htmlentities($_POST['lastname']);
		$user->email = htmlentities($_POST['useremail']);
		$user->city = htmlentities($_POST['city']);
		$user->country = htmlentities($_POST['country']);

	
		R::store($user);
		$_SESSION['logged_user'] = $user;
		header('Location: ' . HOST . "profile");
		exit();
	}

}

 //Подготавливаем контент для центральной части
    ob_start();
    include(ROOT . 'templates/_parts/_header.tpl');
    include(ROOT . 'templates/profile/profile-edit.tpl');
    $content = ob_get_contents();
    ob_end_clean();
    //Подключаем основные шаблоны
    include(ROOT . 'templates/_parts/_head.tpl');
    include(ROOT . 'templates/template.tpl');
    include(ROOT . 'templates/_parts/_footer.tpl');
    include ROOT . "templates/_parts/_foot.tpl";
 ?>