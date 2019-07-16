<div class="text-center heade-text">
    <h3 class="text-capitalize">Coming soon</h3>
</div>
<?php
$currentsyncno = $this->ordersm->getcronsync(2);
?>
<div class="container">
    <div class="row">
        <div class="col-sm-12 col-xs-12">
            <?php if ($this->session->flashdata('message')) { ?>
                <div class="alert alert-success">
                    <?php echo $this->session->flashdata('message'); ?>
                </div>
            <?php } ?>
            <?php if ($this->session->flashdata('error')) { ?>
                <div class="alert alert-danger">
                    <?php echo $this->session->flashdata('error'); ?>
                </div>
            <?php } ?>
        </div>
        <div class="col-sm-12 col-xs-12">
            <p>Please put final_orders_and_customers.csv into root/dump/final_orders_and_customers.csv</p>
            <a id="uploadorders" class="btn btn-primary update-larg" href="<?php echo base_url('orders/upload'); ?>">Upload Orders</a>
            <input type="hidden" id="url" value="<?php echo base_url(); ?>">
            <input type="hidden" id="currentsyncno" value="<?php echo $currentsyncno->tasksyncno; ?>">
            <input type="hidden" id="totalorders" value="0">
            <div id="orders_count" style="display: none;">
                <span class="syncorders"></span> / <span class="totalorders"></span><span class="imagesync" style="display: none;"><img style="width: 20px;" src="<?php echo base_url(); ?>assets/images/loader.gif"></span>
            </div>
            <div id="orders_data">
                
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        
        var j = 0;
        var k = 0;
        $('#uploadorders').click(function(e){
            e.preventDefault();
            if(confirm('Are you sure?')){
                ordercount();
            }
        });
        
        function ordercount(){ /*Get number od customers */
            var k = $('#currentsyncno').val();
            var baseurls = $('#url').val();
            var furls = baseurls+'orders/countorders';
            $.ajax({
                url: furls,
                dataType:'json',
                success: function(orderresult){
                    $('#orders_count, .imagesync').show();
                    $('#orders_count .syncorders').text(0);
                    $('#orders_count .totalorders').text(orderresult.count);
                    $('#totalorders').val(orderresult.count);
                    if(k < orderresult.count){
                        uploadorders(k);
                    }else{
                        $('.imagesync').hide();
                    }
                }
            });
        }

        function uploadorders(k){ /*Add category for sync*/
            var $totalorders = $('#totalorders').val();
            var baseurl = $('#url').val();
            var furl = baseurl+'orders/upload';
            $.ajax({
                url: furl,
                dataType:'json',
                method:'POST',
                data: { currentsyncno: k},
                success: function(data){
                    
                    if(data.status == 'finish'){
                        $('.imagesync').hide();
                    } else {
                        
                        $.each(data.orderlist, function(index, value){
                            $('#orders_data').prepend('<div class="order '+value.status+'">'+value.message+'</div>');
                        });
                        
                        $('#orders_count .syncorders').text(data.lastsync);
                        $('#currentsyncno').val(data.lastsync);
                        
                        if(data.lastsync <= $totalorders){
                            
                            uploadorders(data.lastsync);
                        }else{
                            
                            $('.imagesync').hide();
                            alert('finish');
                        }
                    }
                },
                error: function (jqXHR, exception) {
                    var msg = '';
                    if (jqXHR.status === 0) {
                        msg = 'Not connect.\n Verify Network.';
                    } else if (jqXHR.status == 404) {
                        msg = 'Requested page not found. [404]';
                    } else if (jqXHR.status == 500) {
                        msg = 'Internal Server Error [500].';
                    } else if (exception === 'parsererror') {
                        msg = 'Requested JSON parse failed.';
                    } else if (exception === 'timeout') {
                        msg = 'Time out error.';
                    } else if (exception === 'abort') {
                        msg = 'Ajax request aborted.';
                    } else {
                        msg = 'Uncaught Error.\n' + jqXHR.responseText;
                    }
                    alert(msg);
                }
            });
        }
    }); 
</script>
<style>
    #orders_data .order{border-bottom: 1px solid #000;}
    #orders_data .order.error{padding: 5px 0;color: red;}
    #orders_data .order.success{padding: 5px 0;color: green;}
</style>