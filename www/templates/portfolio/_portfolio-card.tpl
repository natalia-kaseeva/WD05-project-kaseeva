<div class="col-auto pl-0 pr-0 ml-10 mr-10 mb-40">
	<div class="card-box card-box--height">
		<div class="card-box__img-portfolio">

			<?php if ($work->work_img_small != "") { ?>
			<img src="<?=HOST?>usercontent/portfolio/<?=$work['work_img_small']?>" alt="<?=$work['title']?> " />
			<?php } else { ?>
				<img src="<?=HOST?>usercontent/portfolio-no-image.jpg" alt="<?=$work['title']?>" />
			<?php } ?>

		</div>
		<div class="card-box__title"><?=mbCutString($work->title, 43)?></div>
		<a class="button card-box--button" href="<?=HOST?>portfolio/work?id=<?=$work['id']?>">Смотреть кейс</a>
	</div>
</div>