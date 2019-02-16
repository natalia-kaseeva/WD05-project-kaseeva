<div class="container pb-100 pt-80 pl-0 pr-0">

	<?php if ( isset($_GET['result']) ) { ?>
		<?php include ROOT . "templates/portfolio/_result.tpl" ?>
	<?php }	?>

	<div class="works-title mb-35">
		<div class="works-title-left">
			<h1 class="works-title-text"><span class="works-title-text--bold">Работы</span>, которые сделал я и моя команда</h1>
		</div>
		<div class="works-title-right">
			<?php if (isAdmin()) { ?>
			<a class="button button-edit" href="<?=HOST?>portfolio/work-new">Добавить работу</a>
				<?php } ?>
		</div>
	</div>
	<div class="row ml-0 mr-0">
		
			<?php foreach ($works as $work) { ?>
			<?php include ROOT . "templates/portfolio/_portfolio-card.tpl" ?>
			<?php 	}	?>

	</div>
</div>