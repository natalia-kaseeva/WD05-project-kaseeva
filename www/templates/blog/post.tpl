<div class="container pt-80 pb-120">
    <div class="row">
        <div class="col-10 offset-1">
            <div class="post">

                <?php
                    if(isset($_GET['result'])) {
                        include(ROOT . 'templates/blog/_results.tpl');
                    }
                ?>

                <div class="post-head">
                    <h1 class="title-general mb-0 mt-0"><?=$post['title']?></h1>
                     <?php if(isAdmin()) { ?>
                    <div class="post-head-buttons">
                    <a class="button button-edit mr-15" href="<?=HOST?>blog/post-edit?id=<?=$post['id']?>">Редактировать</a>
                    <a class="button button-delete" href="<?=HOST?>blog/post-delete?id=<?=$post['id']?>">Удалить</a>
                    </div>
                    <?php } ?>
                </div>
                <div class="post-info">
                    <div class="post-info__author"><?=$post['username']?> <?=$post['lastname']?></div>
                    <div class="post-info__topic"><a class="postlink" href="#"><?=$post['cat_title']?></a></div>
                    <div class="post-info__date">

                        <?php if(isset($post['update_time']))
                            echo rus_date('j F Y H:i', strtotime($post['update_time']));
                        else 
                            echo rus_date('j F Y H:i', strtotime($post['data_time']));
                        ?>

                    </div>
                    <div class="post-info__comments">
                        <a class="postlink" href="#usersComment"><?=commentNumber(count($comments))?></a>
                    </div>
                </div>
                    <div class="post-img">
                        <?php if($post['post_img'] != '') { ?>
                        <img src="<?=HOST?>usercontent/blog/<?=$post['post_img']?>" alt="<?=$post['title']?>" />
                        <?php } else {?>
                        <img src="<?=HOST?>usercontent/blog-no-image-big.jpg?>" alt="<?=$post['title']?>" />
                        <?php }?>
                    </div>
                
                <div class="post-content mb-25"><?=$post['text']?></div>
                <div class="post-buttons-nav mb-25">
                    <a class="button button-previous" href="#">Назад 
                        <span class="button__icon button__icon--mright float-left">
                            <i class="mr-0 fas fa-arrow-left"></i>
                        </span></a>
                        <a class="button button-next" href="#">Вперед 
                            <span class="button__icon"><i class="mr-0 fas fa-arrow-right"></i>
                            </span>
                        </a>
                    </div>
            </div>
        <?php include(ROOT . 'templates/blog/_all-comments.tpl');?>
        <?php include(ROOT . 'templates/blog/_form-add-comments.tpl');?>
        </div>
    </div>
</div>

