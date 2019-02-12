<div class="container pl-0 pr-0 pt-80 pb-120">
    <div class="row m-0">
        <div class="col-10 offset-1 p-0">
            <div class="add-post-content">
                <h1 class="title-general mt-0 mb-10">Удалить пост</h1>

               <p>Вы действительно хотите удалить сообщение от пользователя <strong><?=$message['name']?></strong> с id = <?=$message['id']?>?</p>
                
                <form method="POST" action="<?=HOST?>message-delete?id=<?=$message['id']?>">
                    <div class="add-post-content__submit mt-30">
                        <input class="button button-delete mr-20" type="submit" name="messageDelete" value="Удалить">
                        <a class="button" href="<?=HOST?>contacts-messages">Отмена</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>