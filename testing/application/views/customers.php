<div class="text-center heade-text">
    <h3 class="text-capitalize">Coming soon</h3>
</div>
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
            <p>Please put customer.csv into root/dump/final_orders_and_customers.csv</p>
            <a id="uploadcustomers" class="btn btn-primary update-larg" href="<?php echo base_url('customers/upload'); ?>">Upload customers</a>
            <input type="hidden" id="url" value="<?php echo base_url(); ?>">
            <input type="hidden" id="currentsyncno" value="0">
            <input type="hidden" id="totalcustomers" value="0">
            <div id="custmers_count" style="display: none;">
                <span class="synccustomers"></span> / <span class="totalcustomers"></span><span class="imagesync" style="display: none;"><img style="width: 20px;" src="<?php echo base_url(); ?>assets/images/loader.gif"></span>
            </div>
            <div id="custmers_data">
                
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        
        var j = 0;
        var k = 0;
        $('#uploadcustomers').click(function(e){
            e.preventDefault();
            if(confirm('Are you sure?')){
                customercount();
            }
        });
        
        function customercount(){ /*Get number od customers */
            var k = $('#currentsyncno').val();
            var baseurls = $('#url').val();
            var furls = baseurls+'customers/countcustomers';
            $.ajax({
                url: furls,
                dataType:'json',
                success: function(customerresult){
                    $('#custmers_count, .imagesync').show();
                    $('#custmers_count .synccustomers').text(0);
                    $('#custmers_count .totalcustomers').text(customerresult.count);
                    $('#totalcustomers').val(customerresult.count);
                    if(k < customerresult.count){
                        uploadcustomers(k);
                    }else{
                        $('.imagesync').hide();
                    }
                }
            });
        }

        function uploadcustomers(k){ /*Add category for sync*/
            var $totalcustomers = $('#totalcustomers').val();
            var baseurl = $('#url').val();
            var furl = baseurl+'customers/upload';
            $.ajax({
                url: furl,
                dataType:'json',
                method:'POST',
                data: { currentsyncno: k},
                success: function(data){
                    
                    if(data.status == 'finish'){
                        $('.imagesync').hide();
                    } else {
                        
                        $.each(data.customerlist, function(index, value){
                            $('#custmers_data').prepend('<div class="customer '+value.status+'">'+value.message+'</div>');
                        });
                        
                        $('#custmers_count .synccustomers').text(data.lastsync);
                        $('#currentsyncno').val(data.lastsync);
                        
                        if(data.lastsync <= $totalcustomers){
                            
                            uploadcustomers(data.lastsync);
                        }else{
                            
                            $('.imagesync').hide();
                            alert('finish');
                        }
                    }
                }
            });
        }
    }); 
</script>
<style>
    #custmers_data .customer{border-bottom: 1px solid #000;}
    #custmers_data .customer.error{padding: 5px 0;color: red;}
    #custmers_data .customer.success{padding: 5px 0;color: green;}
</style>