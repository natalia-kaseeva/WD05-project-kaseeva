<?php if ( $_GET['result'] == 'jobCreated' ) { ?>
	<div class="notification" data-notify-hide>
		<div class="notify notification--success notification__title mb-30">
			Новое место работы добавлено!
		</div>
	</div>
		
<?php }	?>

<?php if ( $_GET['result'] == 'jobDeleted' ) { ?>
	<div class="notification" data-notify-hide>
		<div class="notify notification--error notification__title mb-30">
			Место работы  удалено!
		</div>
	</div>
		
<?php }	?>

<?php if ( $_GET['result'] == 'textUpdated' ) { ?>
	<div class="notification" data-notify-hide>
		<div class="notify notification--success notification__title mb-30">
			Информация обновлена!
		</div>
	</div>
		
<?php }	?>

<?php if ( $_GET['result'] == 'skillsUpdated' ) { ?>
	<div class="notification" data-notify-hide>
		<div class="notify notification--success notification__title mb-30">
			Информация о технологиях обновлена!
		</div>
	</div>
		
<?php }	?>