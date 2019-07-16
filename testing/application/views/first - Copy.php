<!DOCTYPE html>
<html lang="en">
    <!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
    <!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
    <!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
    <!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><?php echo isset($title) ? $title : 'Metiz B Shipping'; ?></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    <link rel="stylesheet" href="<?php echo base_url("assets/css/bootstrap.css"); ?>" />
    <link rel="stylesheet" href="<?php echo base_url("assets/css/custom.css"); ?>" />
    <script type="text/javascript" src="<?php echo base_url("assets/js/jquery-1.12.3.min.js"); ?>"></script>
	<script type="text/javascript" src="<?php echo base_url("assets/js/jquery.validate.min.js"); ?>"></script>
	  <script src='https://ajax.googleapis.com/ajax/libs/angularjs/1.6.1/angular.min.js'></script>
    

	
	    <script src="<?=base_url("assets/js/jquery.min.js"); ?>" type="text/javascript" ></script>
		<script type="text/javascript" src="<?php echo base_url("assets/js/jquery-ui.min.js"); ?>"></script>
		<script type="text/javascript" src="<?php echo base_url("assets/js/jquery.validate.min.js"); ?>"></script>
		<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="<?php echo base_url("assets/js/bootstrap.min.js"); ?>"></script>
	
	
	
	
	
    <!--<script src="https://cdn.shopify.com/s/assets/external/app.js"></script>
    <script type="text/javascript">
       ShopifyApp.init({
         apiKey: '<?php echo API_KEY; ?>',
         shopOrigin: 'https://<?php echo $this->session->userdata("shop"); ?>'
       });
       ShopifyApp.ready(function(){
        setTimeout(function(){
           ShopifyApp.Bar.loadingOff();
           ShopifyApp.Bar.initialize({"title":"Exit Coupon Popup","icon":"gocart/themes/default/assets/img/logo.png"});
        },1000);
     });
     </script>-->
    
<!-- Load Facebook SDK for JavaScript -->



</head>
<body>
    
    <div class="container">
        <div class="header_top">
 
            
                    <form class="form-inline" name="myForm" id="myForm" action="'<?= base_url("cfirst/success"); ?>'">
						  		 	
                          <br><br>			  
							<input type="text" class="form-control numeric articleid" id="articleid" name="articleid" style="width:130px;" >
						  	
                          <br><br>					  
							<button type="submit" class="btn btn-success" id='submit' name="submit" >Submit</button>
						  
                    </form>
                    
					
             
        
        </div>
    </div>


		
<script>	
	
$(document).ready( function () {
	
 $('#myForm').validate({	
	
	
	 rules: {
		 
        articleid: { 
            		
            remote: {
                url:  '<?= base_url("cfirst/isAvailable"); ?>',
                type: 'post',				 
                success: function(data) {
					console.log(data);
                    // if (data.articleid == 'found')
                    // {
                        // message: {
                            // articleid : 'The articleid is already in use!'
                        // }
                    // }
                }

            }
          }  
     
	    },
		messages:{
                articleid: {
                    remote: "Articleid already taken"
                }
        },
		submitHandler: function(event) {
          event.preventDefault();   
		 
		      $("#myForm")[0].submit();
		  
        }
		
    });

});	






// $(document).ready(function(){
            // $('#myForm').validate({
            // rules: {
                // articleid: {
                    // remote: {
                        // url: '<?= base_url("cfirst/isAvailable"); ?>',
                        // type: "post",
                        // data: {
                          // articleid: function() {
                            // return $( "#articleid" ).val();
                          // }
                        // }
                      // }               
                // }
            // },
            // messages:{
                // articleid: {
                    // remote: "Username already taken"
                // }
            // }
        // });});	
</script>
</body>