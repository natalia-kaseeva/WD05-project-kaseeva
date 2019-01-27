<div class="container">
			<div class="row">
				<div class="col-12 flex--center">
					<div class="autorization-content">
						<?php if($newPasswordReady == false): ?>
						<h1 class="autorization-content__title mb-40">Восстановление пароля пользователя</h1>
						<?php endif ?>
						<?php require ROOT . "templates/_parts/_errors.tpl" ?>
						<?php require ROOT . "templates/_parts/_success.tpl" ?>
						<form class="autorization-content-form" method="POST" action="<?=HOST?>set-new-password">

							<?php if($newPasswordReady == false): ?>
							<input name="resetpassword" class="input mb-10 mt-20" type="password" placeholder="Новый пароль" />
							<?php endif ?>


							<div class="autorization-content-form-help mb-30">
								<a class="link" href="<?=HOST?>login">Перейти на страницу входа</a></div>
							<?php if($newPasswordReady == false): ?>
							<div class="autorization-content-form-button">
								<input type="hidden" name="resetemail" value="<?=$_GET['email']?>">
            					<input type="hidden" name="onetimecode" value="<?=$_GET['code']?>">
								<input class="button button-enter" type="submit" name="set-new-password" value="Установить новый пароль" />
							</div>
							<?php endif ?>
						</form>
					</div>
				</div>
			</div>
		</div>