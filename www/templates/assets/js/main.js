$(document).ready(function() {

/*setTimeOut (function() {
	$('[data-notify-hide]').slideUp(400);

},500);
*/
$('[data-notify-hide]').dblclick(function(){
	this.slideUp(400);
});

$('[data-notify-hide]').delay(4000).slideUp(400);

/*CKEDITOR.replace('ckEditor');*/

});


