<div class="container pt-55 pb-80">
	<div class="row">
		<?php if ( isAdmin() ) { ?>
		<div class="col-12 clearfix mb-30"><a class="button float-right" href="<?=HOST?>contacts-messages">Сообщения</a><a class="button button-edit float-right mr-20" href="<?=HOST?>contacts-edit">Редактировать</a></div>
		<?php }  ?>

		<div class="col-5">
			<h1 class="title-general mb-30">Контакты</h1>

			<?php if($contacts['firstname'] != '') { ?>
			<div class="row mb-15">
				<div class="col-6 contacts-category">
					<p>Имя</p>
				</div>
				<div class="col-6 link-box-info">
					<p><?=$contacts['firstname']?></p>
				</div>
			</div>
			<?php } ?>

			<?php if($contacts['lastname'] != '') { ?>
			<div class="row mb-15">
				<div class="col-6 contacts-category">
					<p>Имя</p>
				</div>
				<div class="col-6 link-box-info">
					<p><?=$contacts['lastname']?></p>
				</div>
			</div>
			<?php } ?>

			<?php if($contacts['email'] != '') { ?>
			<div class="row mb-15">
				<div class="col-6 contacts-category">
					<p>Email</p>
				</div>
				<div class="col-6 link-box-info">
					<p><a class="link" href="mailto:<?=$contacts['email']?>" target="_blank"><?=$contacts['email']?></a></p>
				</div>
			</div>
			<?php } ?>

			<?php if($contacts['skype'] != '') { ?>
			<div class="row mb-15">
				<div class="col-6 contacts-category">
					<p>Skype</p>
				</div>
				<div class="col-6 link-box-info">
					<p><a class="link" href="skype:<?=$contacts['skype']?>?chat" target="_blank"><?=$contacts['skype']?></a></p>
				</div>
			</div>
			<?php } ?>

			<?php if($contacts['github'] != '') { ?>
			<div class="row mb-15">
				<div class="col-6 contacts-category">
					<p>Github</p>
				</div>
				<div class="col-6 link-box-info">
					<p><a class="link" href="<?=$contacts['github']?>" target="_blank"><?=$contacts['github']?></a></p>
				</div>
			</div>
			<?php } ?>

			<div class="row mb-15">
			<?php if($contacts['vkontakte'] != '' || $contacts['facebook'] != '' || $contacts['twitter'] != '') { ?>
			
				<div class="col-6 contacts-category">
					<p>Социальные сети</p>
				</div>
				<div class="col-6 link-box-info">

					<?php if($contacts['vkontakte'] != '') { ?>
					<p><a class="link link--bold" href="<?=$contacts['vkontakte']?>" target="_blank">Профиль Вконтакте</a></p>
					<?php } ?>
					<?php if($contacts['facebook'] != '') { ?>
					<p><a class="link link--bold" href="<?=$contacts['facebook']?>" target="_blank">Профиль Facebook</a></p>
					<?php } ?>
					<?php if($contacts['twitter'] != '') { ?>
					<p><a class="link link--bold" href="<?=$contacts['twitter']?>" target="_blank">Профиль Twitter</a></p>
					<?php } ?>

				</div>
				<?php } ?>
			</div>

			<?php if($contacts['phone'] != '') { ?>
			<div class="row mb-15">
				<div class="col-6 contacts-category">
					<p>Телефон</p>
				</div>
				<div class="col-6 info">
				<p><a class="link" href="tel:<?=$contacts['phone']?>"  target="_blank"><?=$contacts['phone']?></a></p>
				</div>
			</div>
			<?php } ?>
			<?php if($contacts['address'] != '') { ?>
			<div class="row mb-15">
				<div class="col-6 contacts-category">
					<p>Адрес</p>
				</div>
				<div class="col-6 info">
					<p><?=$contacts['address']?></p>
				</div>
			</div>
			<?php } ?>
		</div>

		<div class="col-4 offset-1">
			<div class="title-general mb-40">Связаться со мной</div>

			<?php require(ROOT . 'templates/_parts/_errors.tpl');?>
            <?php require(ROOT . 'templates/_parts/_success.tpl');?>
		
			<?php if ( isset($_GET['result']) ) { ?>
            <?php include ROOT . "templates/contacts/_result.tpl" ?>
            <?php } ?> 

			<form class="feedback-form" method="POST" enctype="multipart/form-data" action="<?=HOST?>contacts" novalidate>
				<input class="input" name="name-user" type="text" placeholder="Введите имя" value="<?=@$_POST['name-user']?>" />
				<input class="input" name="email-user" type="email" placeholder="Email" value="<?=@$_POST['email-user']?>"/>
				<textarea class="textarea mb-20" name="user-message" placeholder="Сообщение"><?=@$_POST['user-message']?></textarea>
				<section class="upload-file">
					<h6 class="upload-file__title">Прикрепить файл</h6>
					<p class="upload-file__description">jpg, png, pdf, doc, весом до 2Мб.</p>
					<input class="input-file" type="file" name="upload-file" id="upload-file" data-multiple-caption="{count}" /><label class="input-file-mark input-file-mark--rounded" for="upload-file">Выбрать файл</label>
					<span>Файл не выбран</span>
				</section>
				<input class="button button-save mt-20" type="submit" name="newMessage" value="Отправить" />
			</form>
		</div>
	</div>
</div>
<div class="geolocation" id="map"></div>
<script src="<?=HOST?>templates/assets/js/googlemap.js"></script>