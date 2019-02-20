<div class="container mt-70 mb-120">
	<div class="title-1">Заказы в системе</div>

	<table class="table">
		<thead>
				<tr class="table-total">
					<td></td>
					<td></td>
					<td>Сумма</td>
					<td>Статус</td>
					<td>Покупатель</td>
					<td></td>
				</tr>
		</thead>

		<tbody>
			<?php foreach ($orders as $order) { ?>
			<?php include ROOT . "templates/orders/_order-item-in-table.tpl" ?>
			<?php } ?>
		</tbody>
	</table>

</div>