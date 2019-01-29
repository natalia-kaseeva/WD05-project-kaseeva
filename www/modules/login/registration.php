<?php 

$title = "Регистрация";

// Если форма отправлена - то делаем регистрацию
if ( isset($_POST['enter-button'])) {
		$pattern = '/^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z{2,4}\.])?[a-z]{2,4}$/i';


		if ( trim($_POST['email']) == '' ) {
			$errors[] = ['title' => 'Введите Email', 'desc' => 'Email обязателен для регистрации на сайте' ];
		} else if (!preg_match($pattern, trim($_POST['email']))) {
			$errors[] = ['title' => 'Неверный формат email'];
		}


		if ( trim($_POST['password']) == '') {
			$errors[] = ['title' => 'Введите Пароль' ];
		}

	// Проверка что пользователь уже существует
		if ( R::count('users', 'email = ?', array($_POST['email']) ) > 0 ) {
		$errors[]  = [ 'title' => 'Пользователь с таким email уже зарегистрирован', 'desc' => 'Используйте другой Email адрес, или воспользуйтесь восстановлением пароля.'];
	}

		if ( empty($errors) ) {
			// Alright, Register!
			$user = R::dispense('users');
			$user->email = htmlentities($_POST['email']);
			$user->role = 'user';
			$user->password = password_hash($_POST['password'], PASSWORD_DEFAULT);
			R::store($user);

			$_SESSION['logged_user'] = $user;
			$_SESSION['login'] = "1";
			$_SESSION['role'] = $user->role;

			header('Location: ' . HOST . "profile");
			//header('Location: ' . HOST);
			exit();

		}

}
// Готовим контент для центральной части
ob_start();
include ROOT . "templates/login/form-registration.tpl";
$content = ob_get_contents();
ob_end_clean();

include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/login/login-page.tpl";

 ?>