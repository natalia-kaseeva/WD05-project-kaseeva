<div class="container mt-70 mb-120">
	<div class="title-1">Мои заказы</div>

	<?php
        if(isset($_GET['result'])) {
            include(ROOT . 'templates/orders/_results.tpl');
        }
    ?>

	<table class="table">
		<thead>
				<tr class="table-total">
					<td></td>
					<td></td>
					<td>Сумма</td>
					<td>Статус</td>
					<td></td>
					<td></td>
				</tr>
		</thead>
		<tbody>
			<?php foreach ($myOrders as $order) { ?>
			<?php include ROOT . "templates/orders/_myorder-item-in-table.tpl" ?>
			<?php } ?>
		</tbody>
	</table>

</div>