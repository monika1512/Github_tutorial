/*jQuery(document).ready(function(){
    $('body *').contents().each(function() {
        if(this.nodeType == 3) {
            var u = this.nodeValue;
            var reg = /\[(jems-countdown-timer.*)\]/g;
            $(this).replaceWith(u.replace(reg,'<div class="metcounter" $1>kanasagra</div>'));
        }
    });
  });*/
jQuery(document).ready(function(){
    $('body div.metcounter').each(function() {
        var $this = $(this),
            token = $this.attr('token'),
            data_id = $this.attr('data-id');
        if(token){
            jQuery.ajax({
                url: 'https://gingerfresh.com/timercount/plugins/getdata/'+token+'/'+data_id,
                dataType: "json",
                type: 'get',
                success: function (data) {
                    if(data.success == true){
                        $this.append('<iframe frameborder="0" src="https://gingerfresh.com/timercount/plugins/timercount/'+data.content+'" width="500" height="200"></iframe>');
                    }
                }
            });
        }
    });
    
});