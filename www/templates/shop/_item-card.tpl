<div class="col-auto pl-0 pr-0 mr-30 mb-50 col--margin">
	<div class="card-box">
		<div class="card-box__img-blog">

			<?php if($item->img_small != "") { ?>
			<img src="<?=HOST?>usercontent/shop/<?=$item->img_small?>" alt="<?=$item->title?>" />
			<?php } else {?>
			<img src="<?=HOST?>usercontent/blog-no-image.jpg?>" alt="<?=$item->title?>" />
			<?php }?>

		</div>

		<div class="card-box__title">
			<?=mbCutString($item->title, 42)?>
		</div>

		<div class="row">
			<div class="col">
		<div class="card__price">
			<?=price_format($item['price'])?> <span>рублей</span>
		</div>
		</div>

			<div class="col">
		<a class="button card-box--button" href="<?=HOST?>shop/item?id=<?=$item->id?>">Смотреть</a>
		</div>
		</div>
	</div>
</div>