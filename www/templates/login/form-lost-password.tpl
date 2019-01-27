<div class="container">
			<div class="row">
				<div class="col-12 flex--center">
					<div class="autorization-content">
						<h1 class="autorization-content__title mb-40">Забыл пароль</h1>
						<form class="autorization-content-form" method="POST" action="<?=HOST?>lost-password" novalidate>

						<?php require ROOT . "templates/_parts/_errors.tpl" ?>
						<?php require ROOT . "templates/_parts/_success.tpl" ?>
						
							<input class="input mb-10 mt-20" name="email" id="input-email" type="email" placeholder="E-mail" />

							<div class="autorization-content-form-help mb-30">
								<a class="link" href="<?=HOST?>login">Перейти на страницу входа</a></div>
							<div class="autorization-content-form-button"><input class="button button-enter" type="submit" name="lost-password" value="Восстановить пароль" /></div>
						</form>
					</div>
				</div>
			</div>
		</div>