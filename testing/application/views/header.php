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
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand logo" href="<?php echo base_url(); ?>">
                            <span style="color:#3C985D">Oracle</span> Responses
                        </a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse" aria-expanded="false" style="height: 1px;">

                        <ul class="nav navbar-nav navbar-right">
                            <li class=""><a href="<?php echo base_url('customers'); ?>">Upload Customers</a></li>
                            <li class=""><a href="<?php echo base_url('orders'); ?>">Upload Orders</a></li>
                            <li class=""><a href="<?php echo base_url('help'); ?>">Help</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>



