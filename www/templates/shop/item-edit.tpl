<div class="container pl-0 pr-0 pt-80 pb-120">
    <div class="row m-0">
        <div class="col-10 offset-1 p-0">
            <div class="add-post-content">
                <h1 class="title-general mt-0 mb-10">Редактировать товар</h1>

                <?php require(ROOT . 'templates/_parts/_errors.tpl');?>

                <form enctype="multipart/form-data" method="POST" action="<?=HOST?>shop/item-edit?id=<?=$item['id']?>">
                    <div class="add-post-content__name mt-40">
                        <label class="label" for="add-post-name">Название</label>
                        <input class="input" name="title" id="add-post-name" type="text" placeholder="Введите название" value="<?=$item['title']?>" />
                    </div>

                    <div class="row">
                        <div class="col">
                            <div class="add-post-content__name mt-40">
                            <label class="label" for="add-post-name">Цена</label>
                            <input class="input" name="price" id="add-post-name" type="text" placeholder="Введите новую цену" value="<?=$item['price']?>" />
                        </div>
                    </div>

                        <div class="col">
                            <div class="add-post-content__name mt-40">
                            <label class="label" for="add-post-name">Старая цена</label>
                            <input class="input" name="priceOld" id="add-post-name" type="text" placeholder="Введите старую цену" value="<?=$item['priceOld']?>" />
                            </div>
                        </div>
                    </div>

                    
                    <div class="add-post-content__img mt-30">
                        <section class="upload-file">
                            <h6 class="upload-file__title">Изображение</h6>
                            <p class="upload-file__description">Изображение jpg или png, рекомендуемая ширина 945px и больше, высота от 400px и более, вес до 2Мб.</p>
                            <input class="input-file" type="file" name="itemImg" id="upload-file" data-multiple-caption="{count}" />
                            <label class="input-file-mark" for="upload-file">Выбрать файл</label><span>Файл не выбран</span>
                        </section>
                        <?php if($item['img_small'] != '') { ?>
                            <div class="upload-file-image-box mt-30">
                                <img src="<?=HOST?>usercontent/shop/<?=$item['img_small']?>">
                                <!-- <input class="button button-delete button--small-delete upload-file-image-box--button-position" type="submit" name="delete-postImg" value="Удалить"> -->
                            </div>
                            <?php } ?>
                    </div>

                    <div class="add-post-content__main mt-30">
                        <label class="label" for="addPostText">Описание</label>
                            <textarea class="textarea input-post-content" name="itemDesc" id="ckEditor" placeholder="Введите текст поста"><?=$item['desc']?></textarea>
                            <?php include_once ROOT . "templates/_parts/_ckEditorConnect.tpl" ?>
                        </div>

                    <div class="add-post-content__submit mt-30">
                        <input class="button button-save mr-20" type="submit" name="itemUpdate" value="Сохранить" />
                        <a class="button" href="<?=HOST?>shop">Отмена</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="<?=HOST?>libs/ckeditor/ckeditor.js"></script>