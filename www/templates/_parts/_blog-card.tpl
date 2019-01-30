<div class="col-auto pl-0 pr-0 mr-30 mb-50 col--margin">
	<div class="card-box">
		<div class="card-box__img-blog">

			<?php if($post->post_img_small !='') { ?>
			<img src="<?=HOST?>usercontent/blog/<?=$post['post_img_small']?>" alt="<?=$post['title']?>" />
			<?php } else {?>
			<img src="<?=HOST?>usercontent/blog-no-image.jpg?>" alt="<?=$post['title']?>" />
			<?php }?>

		</div>
		<div class="card-box__title">
			<?=mbCutString($post->title,48)?>
		</div>
		<a class="button card-box--button" href="<?=HOST?>blog/post?id=<?=$post['id']?>">Читать</a>
	</div>
</div>