<?php if(isLoggedIn()) { ?>
    <h2 class="title-2 m-0 mb-15">Оставить комментарий</h2>
    <div class="comments-submit">
        <div class="user-comment__avatar">
            <div class="avatar avatar--small">
                <?php if($_SESSION['logged_user']['avatar_small'] != "") { ?>
                    <img src="<?=HOST?>usercontent/avatar/<?=$_SESSION['logged_user']['avatar_small']?>" alt="<?=$_SESSION['logged_user']['username']?> <?=$_SESSION['logged_user']['lastname']?>"/>
                <?php }else {?>
                    <img src="<?=HOST?>usercontent/no-avatar-small.jpg?>" alt="<?=$_SESSION['logged_user']['username']?> <?=$_SESSION['logged_user']['lastname']?>" />
                <?php }?>
            </div>
        </div>
        <div class="comments-form">
        <form class="comments-form" method="POST" action="<?=HOST?>blog/post?id=<?=$post['id']?>" >
            <b class="comments__author">
            <?=$_SESSION['logged_user']['username']?>
            <?=$_SESSION['logged_user']['lastname']?>
            </b>
            <?php include(ROOT . 'templates/_parts/_errors.tpl');?>
            <textarea class="textarea" name="comment-user" placeholder="Присоединиться к обсуждению..."></textarea>
            <input class="button mt-10" type="submit" name="addComment" value="Опубликовать" />
            </form>
        </div>
    </div>

    <?php } else { ?>
    <div class="comments-unregistered">
        <p class="comments-unregistered__note">
            <a class="link" href="<?=HOST?>login">Войдите</a> или 
            <a class="link" href="<?=HOST?>registration">Зарегистрируйтесь</a> чтобы оставить комментарий
        </p>
    </div>
<?php } ?>