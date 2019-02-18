<div class="container pl-0 pr-0 pt-80 pb-120">
	<div class="row m-0">
		<div class="col-10 offset-1 p-0">
			<div class="add-post-content">
				<h1 class="title-general mt-0 mb-0">Удалить место работы</h1>	
				<form action="<?=HOST?>edit-delete-jobs?id=<?=$job['id']?>" method="POST">

					<div class="add-post-content__name mt-40">
						<p>Вы действительно хотите удалить данное место работы с id= <?=$job['id']?> ?</p>	

					</div>  
					
					<div class="add-post-content__submit mt-50">
						<input class="button button-delete mr-20" type="submit" name="jobDelete" value="Удалить" />
						<a class="button" name="cancel-new-cat" href="<?=HOST?>edit-jobs">Отмена</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>