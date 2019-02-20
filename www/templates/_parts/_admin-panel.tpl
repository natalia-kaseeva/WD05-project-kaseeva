<div class="header-admin">
    <div class="header-admin__left">
        <div class="user ml-20">
            <a class="avatar-link" href="<?=HOST?>profile">
                <div class="avatar avatar--small">
                    <?php if($_SESSION['logged_user']['avatar_small'] != "") { ?>
                        <img src="<?=HOST?>usercontent/avatar/<?=$_SESSION['logged_user']['avatar_small']?>" alt="<?=$_SESSION['logged_user']['username']?> <?=$_SESSION['logged_user']['lastname']?>"/>
                    <?php }else {?>
                        <img src="<?=HOST?>usercontent/no-avatar-small.jpg?>" alt="<?=$post['title']?>" />
                    <?php }?>
                </div>
            </a>
            <div class="brif ml-20">
                <p class="brif__name"><?=$_SESSION['logged_user']['username']?> <?=$_SESSION['logged_user']['lastname']?></p><span class="badge">Администратор</span>
            </div>
        </div>
        <nav class="admin-nav ml-70">
            <a href="<?=HOST?>blog/post-new"><i class="fas fa-plus-circle"></i>Пост</a>
            <a href="<?=HOST?>blog/categories"><i class="fas fa-folder"></i>Категории</a>
            <a href="<?=HOST?>portfolio/work-new"><i class="fas fa-plus-circle"></i>Работа</a>
            <a href="<?=HOST?>about"><i class="fas fa-edit"></i>Обо мне</a>
            <a href="<?=HOST?>shop/new"><i class="fas fa-plus-circle"></i>Товар</a>
            <a href="<?=HOST?>contacts"><i class="fas fa-edit"></i>Контакты</a>
            <a href="<?=HOST?>contacts-messages"><i class="fas fa-envelope"></i>Сообщения</a>
            <a href="<?=HOST?>orders"><i class="fas fa-shopping-cart"></i>Заказы</a>
        </nav>
    </div>
    <div class="header-admin__right"><a href="<?=HOST?>logout"><i class="fas fa-sign-out-alt"></i>Выход</a></div>
</div>