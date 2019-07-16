<div class="container">
    <input type="text" id="start_page" placeholder="start page">
    <button id="start_export">Start</button>
</div>
<script type="text/javascript">
    (function ($) {

        $('#start_export').on('click', function () {

            var start_page = $('#start_page').val();
            var pages = $('#pages').val();
            $.ajax({
                url: '<?= base_url('homepage/export_order'); ?>',
                method: 'get',
                data: {start_page: start_page},
                success: function (res) {

                    var data = $.parseJSON(res);
                    exportdata(data.start_page);
                }

            });
        });

        function exportdata(start_page, pages) {

            $.ajax({
                url: '<?= base_url('homepage/export_order'); ?>',
                method: 'get',
                data: {start_page: start_page},
                success: function (res) {

                    var data = $.parseJSON(res);
                    exportdata(data.start_page);
                }
            });
        }
    })(jQuery);
</script>