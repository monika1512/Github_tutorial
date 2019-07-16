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
	
</head>
<body>
    
    <div class="container">
        <div class="header_top">
			<form name="test">
					<div class="clone-group">
						<div class="row form-group clone">
							<label class="col-xs-3 control-label">Options</label>
							<div class="col-xs-2">
								<input type="text" class="form-control internal" name="option[]" data-rule-required="true" />
							</div>
							<div class="col-xs-2">
								<input type="text" class="form-control external" name="new[]" data-rule-required="true" />
							</div>
							<div class="col-xs-4">
								<button type="button" class="btn btn-default addButton">+</button>
							</div>
						</div>
					</div>
					<button type="submit">Test</button>
			</form>
        
        </div>
 </div>


		
<script>	
/*!
 * jQuery Validation Plugin v1.13.1-pre
 *
 * http://jqueryvalidation.org/
 *
 * Copyright (c) 2014 JÃ¶rn Zaefferer
 * Released under the MIT license
 */



//validation code


$(function () {
    var cloneItem = $(".clone");
    var cloneWrap = $(".clone-group");
    $(".addButton").on("click", function () {
        cloneItem.clone().appendTo(cloneWrap).find(".addButton")
            .removeClass("addButton").addClass("remButton").text("-");



        $("input").each(function () {
            $(this).rules("add", {
                required: true,
                messages: {
                    required: "Specify the reference name"
                }
            });
        });
    });
    $("body").on("click", ".remButton", function () {
        $(this).closest(".clone").remove();
    });

    $("form").validate({
        submitHandler: function (form) {
            alert('valid form submitted'); 
            return false; 
        },
        rules: {
			    "option[]": {
                required: true
            },
                "new[]": {
                required: true
            }
        },
        messages: {
            "option[]": {
                required: "This field is required"
            }
        },
		
        errorClass: "invalid"
    });
	
});
	
</script>
</body>