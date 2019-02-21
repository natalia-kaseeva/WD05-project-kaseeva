<div class="container mt-70 mb-120">
	<div class="title-2">Оплата заказа через Яндекс.Деньги</div>


	<form method="POST" action="https://money.yandex.ru/quickpay/confirm.xml">    
		
		<input type="hidden" name="receiver" value="<?=YANDEX_WALLET?>">    
		<input type="hidden" name="formcomment" value="Онлайн покупка: <?=SITE_NAME?>">    
		<input type="hidden" name="short-dest" value="Онлайн покупка: <?=SITE_NAME?>">    

		<input type="hidden" name="label" value="<?=$_SESSION['order']['id']?>">    
		<input type="hidden" name="quickpay-form" value="shop">    
		<input type="hidden" name="targets" value="Оплата в магазине <?=SITE_NAME?> заказ № <?=$_SESSION['order']['id']?>">    
		<input type="hidden" name="sum" value="<?=$_SESSION['order']['total_price']?>" data-type="number">  

		<input type="hidden" name="successURL" value="<?=HOST . 'after-payment'?>">

		<!-- <input type="hidden" name="comment" value="Хотелось бы получить дистанционное управление.">     -->
		<!-- <input type="hidden" name="need-fio" value="true">     -->
		<!-- <input type="hidden" name="need-email" value="true">     -->
		<!-- <input type="hidden" name="need-phone" value="false">     -->
		<!-- <input type="hidden" name="need-address" value="false">     -->

		<div class="control-row  mb-15"> 
			<label class="radio">
				<input class="radio__input" type="radio" name="paymentType" value="PC">
				<!-- <span class="radio__check-inner"></span> -->
				<span class="radio__label"></span>
				<span class="radio__label-name">Яндекс.Деньгами</span>
			</label>
		
		</div>  

		<!-- <label><input type="radio" name="paymentType" value="AC">Банковской картой</label>     -->
		 <div class="control-row mb-25"> 
			<label class="radio">
				<input class="radio__input" type="radio" name="paymentType" value="AC">
				<span class="radio__label"></span>
				<span class="radio__label-name">Банковской картой</span>
			</label>		
		</div>

		<input class="button button-save mt-20" type="submit" value="Перевести">
	</form>

</div>