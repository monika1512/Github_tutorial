<div class="container">
	<input type="text" id="start_page" placeholder="start page">
	<input type="text" id="pages" placeholder="pages">
	<button id="start_export">Start</button>
</div>
<script type="text/javascript">
	(function($){

		$('#start_export').on('click', function(){

			var start_page 	= $('#start_page').val();
			var pages 		= $('#pages').val();
			$.ajax({
				url 	: '<?= base_url('homepage/export_customer'); ?>',
				method 	: 'get',
				timeout : 10000000,
				data 	: {start_page : start_page, pages : pages},
				success	: function(res) {

					var data = $.parseJSON(res);
					exportdata(data.start_page, data.pages);
				}

			});
		});

		function exportdata(start_page, pages) {

			$.ajax({
				url 	: '<?= base_url('homepage/export_customer'); ?>',
				method 	: 'get',
				timeout : 10000000,
				data 	: {start_page : start_page, pages : pages},
				success	: function(res) {

					var data = $.parseJSON(res);
					exportdata(data.start_page, data.pages);
				}
			});
		}
	})(jQuery);
</script>