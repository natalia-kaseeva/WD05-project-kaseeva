<?php if($_GET['result'] == 'messageDeleted') { ?>
    <div class="notification mb-10">
        <div class="notification__title notification--success" data-notify-hide>Сообщение  удалено!</div>
    </div>

<?php }	?>

<?php  if($_GET['result'] == 'messageCreated') { ?>
    <div class="notification mb-10">
        <div class="notification__title notification--success" data-notify-hide>Сообщение отправлено!</div>
    </div>
<?php }	?>