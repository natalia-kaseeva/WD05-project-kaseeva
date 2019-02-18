<?php if ( $_GET['result'] == 'workCreated' ) { ?>
	<div class="notification" data-notify-hide>
		<div class="notify notification--success notification__title mb-30">
			Работа добавлена!
		</div>
	</div>
		
<?php }	?>

<?php if ( $_GET['result'] == 'workUpdated' ) { ?>
	<div class="notification" data-notify-hide>
		<div class="notify notification--success notification__title mb-30">
			Работа  отредактирована!
		</div>
	</div>
		
<?php }	?>

<?php if ( $_GET['result'] == 'workDeleted' ) { ?>
	<div class="notification" data-notify-hide>
		<div class="notify notification--error notification__title mb-30">
			Работа  удалена!
		</div>
	</div>
		
<?php }	?>