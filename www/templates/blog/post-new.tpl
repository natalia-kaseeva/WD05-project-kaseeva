<div class="container pl-0 pr-0 pt-80 pb-120">
    <div class="row m-0">
        <div class="col-10 offset-1 p-0">
            <div class="add-post-content">
                <h1 class="title-general mt-0 mb-10">Добавить пост</h1>

                <?php require(ROOT . 'templates/_parts/_errors.tpl');?>

                <form enctype="multipart/form-data" method="POST" action="<?=HOST?>blog/post-new">
                    <div class="add-post-content__name mt-40">
                        <label class="label" for="add-post-name">Заголовок</label>
                        <input class="input" name="post-title" id="add-post-name" type="text" placeholder="Введите заголовок поста" value="<?php if (isset($_POST['post-title'])) echo $_POST['post-title']; ?>" />
                    </div>

                        <div class="add-post-content__name mt-30">
                        <label class="label" for="select-category">Категории</label>
                        <div class="add-post-content__name mt-10">
                            <select class="form-control mt-10" name="postCat">
                               <option disabled selected>Выберите категорию</option>

                                <?php foreach($categories as $category): ?>
                                    <option value="<?=$category['id']?>"><?=$category['cat_title']?></option> 
                                <?php endforeach ?>

                            </select>
                        </div> 
                    </div>
                    
                    <div class="add-post-content__img mt-30">
                        <section class="upload-file">
                            <h6 class="upload-file__title">Изображение</h6>
                            <p class="upload-file__description">Изображение и параметры 945px и больше, высота от 400px</p>
                            <input class="input-file" type="file" name="post-image" id="upload-file" data-multiple-caption="{count}" />
                            <label class="input-file-mark" for="upload-file">Выбрать файл</label><span>Файл не выбран</span>
                        </section>
                    </div>
                    <div class="add-post-content__main mt-30">
                        <label class="label" for="addPostText">Содержание</label>
                            <textarea class="textarea input-post-content" name="post-text" id="ckEditor" placeholder="Введите текст поста"><?php if (isset($_POST['post-text'])) echo $_POST['post-text']; ?></textarea>
                            <?php include_once ROOT . "templates/_parts/_ckEditorConnect.tpl" ?>
                        </div>
                    <div class="add-post-content__submit mt-30">
                        <input class="button button-save mr-20" type="submit" name="add-post" value="Добавить" />
                        <a class="button" href="<?=HOST?>blog">Отмена</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="<?=HOST?>libs/ckeditor/ckeditor.js"></script>