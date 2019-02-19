<div class="container pt-80 pb-120">
    <div class="row">
        <div class="col-10 offset-1">
            <div class="post">

                <?php
                    if(isset($_GET['result'])) {
                        include(ROOT . 'templates/shop/_results.tpl');
                    }
                ?>

                 <?php if(isAdmin()) { ?>
                   <div class="row flex-content-end">
                        <a class="button button-edit mr-15" href="<?=HOST?>shop/item-edit?id=<?=$item['id']?>">Редактировать</a>
                        <a class="button button-delete" href="<?=HOST?>shop/item-delete?id=<?=$item['id']?>">Удалить</a>                      
                </div>
                 <?php } ?>

                 <!-- row -->
                <div class="row">
                    <div class="col">
                        <div class="blog__image">
                            <?php if($item['img'] != "") { ?>
                            <img src="<?=HOST?>usercontent/shop/<?=$item['img']?>" alt="<?=$item['title']?>" />
                            <?php } else {?>
                            <img src="<?=HOST?>usercontent/blog-no-image-big.jpg?>" alt="<?=$item['title']?>" />
                            <?php }?>
                        </div>
                    </div>

        <!-- Item desc  -->
                    <div class="col pt-40">
                        <h1 class="blog__heading"><?=$item['title']?></h1>

                        <div class="price-holder">
                            <?php if ( $item['price_old'] ): ?>
                            <div class="price-old">
                                <?=price_format($item['price_old'])?>
                            </div>
                            <?php endif ?>

                            <div class="price">
                                <?=price_format($item['price'])?> <span>рублей</span>
                            </div>
                        </div>

                        <a href="#!" class="button mb-15" id="addToCart">В корзину</a>

                        <div class="user-content">
                            <?=$item['desc']?>
                        </div>
                    </div>
                    <!-- // Item desc  -->
                </div>
                <!-- // row -->
                  
            </div>
        </div>
    </div>
</div>