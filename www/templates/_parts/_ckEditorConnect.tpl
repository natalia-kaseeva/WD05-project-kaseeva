<script src="<?=HOST?>libs/ckeditor/ckeditor.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() { // Аналог $(document).ready(function(){
	CKEDITOR.replace('ckEditor', {
		customConfig: '<?=HOST?>templates/assets/js/ckEditorConfig.js'
	});
});

document.addEventListener('DOMContentLoaded', function() { // Аналог $(document).ready(function(){
	CKEDITOR.replace('ckEditor1', {
		customConfig: '<?=HOST?>templates/assets/js/ckEditorConfig.js'
	});
});

document.addEventListener('DOMContentLoaded', function() { // Аналог $(document).ready(function(){
	CKEDITOR.replace('ckEditor2', {
		customConfig: '<?=HOST?>templates/assets/js/ckEditorConfig.js'
	});
});

document.addEventListener('DOMContentLoaded', function() { // Аналог $(document).ready(function(){
	CKEDITOR.replace('ckEditor3', {
		customConfig: '<?=HOST?>templates/assets/js/ckEditorConfig.js'
	});
});
</script>