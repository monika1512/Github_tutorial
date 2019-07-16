/*var jQuery;
(function($) {jQuery = $;})(jQuery);*/

//var mainDomain = "http://betaapp.vapewholesalesupply.com";
var mainDomain = "https://app.vapewholesalesupply.com";
/*var baseUrl = mainDomain + '/estimatedate';  */
var baseUrl = mainDomain;

jQuery("head").append('<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">');
jQuery("head").append('<link rel="stylesheet" href="'+ baseUrl +'/assets/css/popup.css" type="text/css">');
//jQuery("head").append('<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>');

jQuery(document).ready(function(){
	var shopurl = Shopify.shop;
	//if(shopurl == "vapesupplier.myshopify.com"){

		jQuery('body .order-return-form').append('<form action="" id="orderForm">');

		jQuery('body .order-return-form').append('<div class="successmessage" style="display:none; font-size: 20px;"></div><br>')

		jQuery('.order-return-form').append('<div class="customerOrderForm hide"></div>');

		jQuery('.customerOrderForm').append('<label class="label_email">Customer Email</label>');
		jQuery('.customerOrderForm').append('<input type="email" class="email" name="email" id="email" value="" placeholder="Enter customer email">');

		jQuery('.customerOrderForm').append('<label class="label_order">Order Number</label>');
		jQuery('.customerOrderForm').append('<input type="text" class="order_number" name="order_number" id="order_number" value="" placeholder="Enter order number">');

		jQuery('.customerOrderForm').append('<button type="submit" class="postOrderLookup">Look Up</button>');
		//jQuery('.order-return-form').append("<br>");;

		jQuery('body .order-return-form').append('</form">');

		jQuery('body .order-return-form').append('<br/><div class="errorReport" style="display:none;"></div>');

		jQuery('body .order-return-form').append('<br/><div class="customerName" style="display:none;"></div>');
		jQuery('body .order-return-form').append('<div class="orderDate" style="display:none;"></div>');

		/*jQuery('body .order-return-form').append('<br/><div class="tableData" style="display:none; height: 500px; overflow-y: auto;"></div>');*/
		jQuery('body .order-return-form').append('<br/><div class="tableData" style="display:none;"></div>');
		
		var tableData = '<table class="table table-striped sortable  sorttable_sorted_reverse" width="100%" cellspacing="0" cellpadding="0" border="0">'+
		                '<thead>'+
		                    '<tr class="top">'+
		                        '<th style="text-align: center; padding: 20px 0px;"><a href="javascript:" onclick="return false" class="head_font_color">Product Name</a></th>'+
		                        '<th style="text-align: center; padding: 20px 0px;"><a href="javascript:" onclick="return false" class="head_font_color">Price</a></th>'+
		                        '<th style="text-align: center; padding: 20px 0px;"><a href="javascript:" onclick="return false" class="head_font_color">Quantity</a></th>'+
		                        '<th style="text-align: center; padding: 20px 0px;"><a href="javascript:" onclick="return false" class="head_font_color">Quantity Received</a></th>  '+
		                        '<th style="text-align: center; padding: 20px 0px;"><a href="javascript:" onclick="return false" class="head_font_color">Returnable</a></th>'+
		                        '<th style="text-align: center; padding: 20px 0px;"><a href="javascript:" onclick="return false" class="head_font_color">Create Return</a></th>'+
		                    '</tr>'+
		                '</thead>'+
		                '<tbody class="responseData">'+
		                '</tbody>'+
		            '</table>';

		jQuery(".tableData").append(tableData);

		jQuery('body .order-return-form').append('<br/><div class="returnHistory" style="display:none"><strong><h1>Return History</h1></strong></div>');
		jQuery('body .order-return-form').append('<br/><div class="tableReturnData" style="display:none;"></div>');

		var tableReturnData = '<table class="table table-striped sortable  sorttable_sorted_reverse" width="100%" cellspacing="0" cellpadding="0" border="0">'+
		                '<thead>'+
		                    '<tr class="top">'+
		                        '<th style="text-align: center; padding: 20px 0px;"><a href="javascript:" onclick="return false" class="head_font_color">Product Name</a></th>'+
		                        '<th style="text-align: center; padding: 20px 0px;"><a href="javascript:" onclick="return false" class="head_font_color">Refund Status</a></th>'+
		                        '<th style="text-align: center; padding: 20px 0px;"><a href="javascript:" onclick="return false" class="head_font_color">#RMA</a></th>'+
		                        '<th style="text-align: center; padding: 20px 0px;"><a href="javascript:" onclick="return false" class="head_font_color">Return Type</a></th>  '+
		                        '<th style="text-align: center; padding: 20px 0px;"><a href="javascript:" onclick="return false" class="head_font_color">Store Note</a></th>'+
		                        '<th style="text-align: center; padding: 20px 0px;"><a href="javascript:" onclick="return false" class="head_font_color">Customer<br>Attachment</a></th>'+
		                        '<th style="text-align: center; padding: 20px 0px;"><a href="javascript:" onclick="return false" class="head_font_color">Owner<br>Attachment</a></th>'+
		                        '<th style="text-align: center; padding: 20px 0px;"><a href="javascript:" onclick="return false" class="head_font_color">Request Date</a></th>'+
		                        '<th style="text-align: center; padding: 20px 0px;"><a href="javascript:" onclick="return false" class="head_font_color">Status</a></th>'+
		                    '</tr>'+
		                '</thead>'+
		                '<tbody class="responseReturnData">'+
		                '</tbody>'+
		            '</table>';

		jQuery(".tableReturnData").append(tableReturnData);

	//}


	jQuery(document).on('click', '.postOrderLookup', function(e){

		var url = baseUrl + "/returncall/getOrderLookup";

		var email = jQuery(".email").val();
		var order_number = jQuery(".order_number").val();
		var testEmail = /[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}/igm;

		if(email == ''){
			alert("Enter email address");
			jQuery(".email").focus();
			return false;
		}else if(!testEmail.test(email)){
			alert("Enter a valid email address");
			jQuery(".email").focus();
			return false;
		}

		if(order_number == ''){
			alert("Enter order number");
			jQuery(".order_number").focus();
			return false;
		}

		if(email != '' && order_number != ''){

			jQuery(".errorReport").hide();

			showLoading();
			jQuery.ajax({
	            url: url,
	            type: "POST",
	            dataType: 'json',
	            data: { 'shop_url': shopurl, 'email': email, 'order_number' : order_number},
	            success: function (response) {
	            	hideLoading();
	            	//console.log(response);

	            	jQuery(".responseData").html('');
	            	jQuery(".responseReturnData").html('');

	            	if(response.status == 1){

	            		returnableData = response.content.returnableData;
	            		var refund_returnable_days = returnableData.refund_returnable_days;
	            		var replacement_returnable_days = returnableData.replacement_returnable_days;

	            		var orderData = response.content;
	            		var customerData = orderData.customer;
	            		var lineItems = orderData.line_items;
	            		//console.log(lineItems);

	            		var returnReasons = response.content.returnReasons;
	            		//console.log(returnReasons)

	            		var formattedDate = new Date(orderData.created_at);
						var date = formattedDate.getDate();
						var month =  formattedDate.getMonth();
						month += 1;
						month =  (month < 10 ? '0' : '') + month;

						var hours = formattedDate.getHours();
						var minutes = formattedDate.getMinutes();
						minutes = (minutes < 10 ? '0' : '') + minutes;
						var seconds = formattedDate.getSeconds();

						var year = formattedDate.getFullYear();

						var customerName;
						if(customerData.first_name != null || customerData.last_name != null){
							customerName = customerData.first_name + ' ' + customerData.last_name;
						}else{
							customerName = customerData.email;
						}

	            		//jQuery(".customerName").html('<b>Customer Name: ' + customerData.first_name + ' ' + customerData.last_name + '</b>');
	            		jQuery(".customerName").html('<b>Customer Name: ' + customerName + '</b>');
	            		jQuery(".orderDate").html('<b>Order Date: ' + year+'-'+month+'-'+date + '</b>');


	            		jQuery.each(lineItems, function (key, data) {

	            			//console.log(data);
	            			
	            			var title = data.title.substr(0,1).toUpperCase()+data.title.substr(1);

	            			var returnQuantity;
	            			var setLink;
	            			if(data.returnQuantity != null){
	            				returnQuantity = data.returnQuantity
	            				setLink = '<a style="font-size:15px; color: #000000;" class="btn" href="javascript:">Submited</a>';
	            			}else{
	            				returnQuantity = "-";
	            				setLink = '<a style="font-size:25px;" class="btn" data-popup-open="popup-'+data.variant_id+'" href="javascript:"><i class="fa fa-undo"></i></a>';
	            			}

						    var $responseTableData = '<tr style="height:50px;">'+
							    						'<td style="text-align: left; width: 400px; padding: 5px 0px 5px 20px;"><b>'+title+'<br>'+(data.variant_title != null ? data.variant_title : '')+'</b></td>'+
							    						/*'<td style="text-align: center">$'+parseFloat((data.price * data.quantity) - data.total_discount).toFixed(2)+'</td>'+*/
							    						'<td style="text-align: center">$'+parseFloat(((data.price * data.quantity) - data.total_discount) / data.quantity ).toFixed(2)+'</td>'+
							    						'<td style="text-align: center">'+data.quantity+'</td>'+
							    						/*'<td style="text-align: center">'+data.quantity+'</td>'+*/
							    						'<td style="text-align: center">' + returnQuantity + '</td>'+
							    						'<td class="row_style row-returnable" style="text-align: center">'+
							    							'<a href="javascript:">Refund: '+refund_returnable_days+' days</a><br>'+
							    							'<a href="javascript:">Replacement: '+replacement_returnable_days+' days</a>'+
							    						'</td>'+
							    						'<td style="text-align: center; padding: 20px 0px 0px 0px;">'+
							    							//'<a style="font-size:25px;" href="javascript:" product_name="GR8APE BY TAFFY MAN 100ML" return_id="83742982" data-toggle="modal" class="btn btn-inverse create_return"><i class="fa fa-shopping-cart"></i></a>'+

							    							//'<a style="font-size:25px;" class="btn" data-popup-open="popup-'+data.variant_id+'" href="javascript:"><i class="fa fa-shopping-cart"></i></a>'+
							    							setLink + '' +

							    							'<form id="save_return" method="post" class="save_return" enctype="multipart/form-data" autocomplete="off">'+

																'<div class="popup" data-popup="popup-'+data.variant_id+'">'+
																	'<div class="popup-inner">'+
																		'<h2><strong>Product Name:'+data.title+'</strong></h2>'+

																		'<div hidden>'+
																			'<input type="text" name="shop_url" id="shop_url" value="'+shopurl+'">'+
																			'<input type="text" name="order_id" id="order_id" value="'+orderData.id+'">'+
																			'<input type="text" name="order_number" id="order_number" value="'+orderData.name+'">'+
																			'<input type="text" name="order_date" id="order_date" value="'+year+'-'+month+'-'+date+' '+hours+':'+minutes+':'+seconds+'">'+
																			'<input type="text" name="customer_id" id="customer_id" value="'+customerData.id+'">'+
																			'<input type="text" name="customer_name" id="customer_name" value="'+customerData.first_name + ' ' + customerData.last_name+'">'+
																			'<input type="text" name="customer_email" id="customer_email" value="'+customerData.email+'">'+
																			'<input type="text" name="product_id" id="product_id" value="'+data.product_id+'">'+
																			'<input type="text" name="variant_id" id="variant_id" value="'+data.variant_id+'">'+
																			'<input type="text" name="product_title" id="product_title" value="'+data.title+'">'+
																			'<input type="text" name="variant_title" id="variant_title" value="'+data.variant_title+'">'+
																			/*'<input type="text" name="price" id="price" value="'+parseFloat((data.price * data.quantity) - data.total_discount).toFixed(2)+'">'+*/
																			'<input type="text" name="price" id="price" value="'+parseFloat(((data.price * data.quantity) - data.total_discount) / data.quantity).toFixed(2)+'">'+
																		'</div>'+

																		'<label class="type">Return Type:</label>'+
																		'<select class="return_type" name="return_type">'+
																			'<option value="Refund" data-note="'+returnableData.refund_note+'">Refund</option>'+
																			'<option value="Replacement" data-note="'+returnableData.replacement_note+'">Replacement</option>'+
																		'</select>'+

																		'<p class="returnNote">'+returnableData.refund_note+'</p>'+

																		'<label>Quantity</label>'+
																		'<input style="width:-webkit-fill-available;" type="number" class="quantity" name="quantity" id="quantity" min="0" data-max_quantity="'+data.quantity+'" max="'+data.quantity+'" required="required">'+

																		'<br><br><label class="type">Return Reason</label>'+
																		'<select class="return_reason" name="return_reason">'+
																		'</select>'+

																		'<label>Customer Notes</label>'+
																		'<textarea style="width:-webkit-fill-available;" class="customer_note" name="customer_note" id="customer_note"></textarea>'+

																		'<label>Attach an Image</label>'+
																		'<input type="file" class="customer_attachment" name="customer_attachment" id="customer_attachment">'+

																		'<br><br><hr>'+

																		'<p><br>'+
																			'<button class="btn btn-inverse requestReturn" style="float:right; margin-left:10px;"><i class="fa fa-check"></i>&nbsp; Submit</button>&nbsp;&nbsp;&nbsp;'+
																			'<button style="float:right;" data-popup-close="popup-'+data.variant_id+'" href="#">Close</button>'+
																		'</p>'+
																		
																		'<a class="popup-close" data-popup-close="popup-'+data.variant_id+'" href="#">x</a>'+
																	'</div>'+
																'</div>'+

															'</form>'+

							    						'</td>'+
							    					'</tr>';
						    jQuery(".responseData").append($responseTableData)
						})

						var reasonDropDown = '';
						jQuery.each(returnReasons, function (key, data) {
							reasonDropDown += '<option value="'+data.reason_name+'">'+data.reason_name+'</option>';
						});

						jQuery(".return_reason").html(reasonDropDown)

	            		jQuery(".customerName").show()
	            		jQuery(".orderDate").show();
	            		jQuery(".tableData").show();

	            		var tableHeight = jQuery(".tableData").height();
	            		if(tableHeight >= 500){
	            			jQuery(".tableData").css('height', '500px');
	            			jQuery(".tableData").css('overflow-y', 'auto');
	            		}

	            		var returnResultsLength = response.content.returnResults.length;

	            		if(returnResultsLength > 0){
	            			var returnResultsArray = response.content.returnResults;

	            			jQuery.each(returnResultsArray, function (key, data) {

	            				console.log(data)
	            				var rma, admin_note, admin_attachment, customer_attachment;
	            				var rfStatus = '';
	            				/*if(data.status != 'pending'){
	            					rma = data.rma_id;
	            				}else{
	            					rma = 'Pending';
	            				}*/

	            				if(data.status == 'approved' || data.status == 'archived'){
	            					rma = data.rma_id;
	            				}else if(data.status == 'pending'){
	            					rma = 'Pending';
	            				}else if(data.status == 'denied'){
	            					rma = 'N/A';
	            				}

	            				if((data.status == 'archived' || data.status == "approved") && data.approve_status == "yes" && data.return_type == "Refund"){
	            					rfStatus = 'Refund Applied';
	            				}else if((data.status == 'archived' || data.status == "approved") && data.approve_status == "yes" && data.return_type == "Replacement"){
	            					rfStatus = 'Replacement Applied';
	            				}else{
	            					rfStatus = "N/A";
	            				}

	            				var formattedDate = new Date(data.created_at);
								var date = formattedDate.getDate();
								var month =  formattedDate.getMonth();
								month += 1;
								month =  (month < 10 ? '0' : '') + month;
								var year = formattedDate.getFullYear();

								if(data.admin_note != null){
									//admin_note = data.admin_note;


									admin_note = '<a style="font-size:25px;" class="btn" data-popup-open-note="popup-note-'+data.variant_id+'" href="javascript:"><i class="fa fa-eye"></i></a>'+

					    							'<div class="popup" data-popup-note="popup-note-'+data.variant_id+'">'+
														'<div class="popup-inner" style="height:210px;">'+
															'<h2><strong>Store Note</strong></h2>'+

															'<p>'+data.admin_note+'</p>'+
															
															'<a class="popup-close" data-popup-close-note="popup-note-'+data.variant_id+'" href="#">x</a>'+
														'</div>'+
													'</div>';

								}else{
									admin_note = "-";
								}
								
								if(data.admin_attachment != null){
									//admin_attachment = data.admin_attachment;
									var fileExtension = data.admin_attachment.substr((data.admin_attachment.lastIndexOf('.') + 1));
									if(fileExtension != 'pdf'){
										admin_attachment = '<a target="_blank" href="'+mainDomain+'/uploads/rma/admin/'+data.admin_attachment+'">'+
							    								'<img src="'+mainDomain+'/uploads/rma/admin/'+data.admin_attachment+'" style="width: 80px; height: 50px;">'+
							    							'</a>';
							    	}else{
							    		admin_attachment = '<a href="'+mainDomain+'/uploads/rma/admin/'+data.admin_attachment+'" target="_blank">PDF Attachment</a>';
							    	}
								}else{
									admin_attachment = "-";
								}
								
								if(data.customer_attachment != null){
									customer_attachment = '<a target="_blank" href="'+mainDomain+'/uploads/rma/customer/'+data.customer_attachment+'">'+
							    								'<img src="'+mainDomain+'/uploads/rma/customer/'+data.customer_attachment+'" style="width: 80px; height: 50px;">'+
							    							'</a>';
								}else{
									customer_attachment = "-";
								}

		            			var title = data.product_title.substr(0,1).toUpperCase()+data.product_title.substr(1);
		            			var tableReturnData = '<tr style="height:50px;">'+
							    						'<td style="text-align: left; width: 400px; padding: 5px 0px 5px 20px;"><b>'+title+'<br>'+(data.variant_title != null ? data.variant_title : '')+'</b></td>'+
							    						'<td style="text-align: center">'+rfStatus+'</td>'+
							    						'<td style="text-align: center">'+rma+'</td>'+
							    						'<td style="text-align: center">' + data.return_type + '</td>'+
							    						/*'<td style="text-align: center">' + admin_note + '</td>'+*/
							    						'<td style="text-align: center">'+admin_note+'</td>'+
							    						'<td style="text-align: center; padding: 20px 10px;">'+
							    								customer_attachment + ' ' +
							    						'</td>'+
							    						'<td style="text-align: center">' + admin_attachment + '</td>'+
							    						'<td style="text-align: center">'  + year + '-'+ month +'-'+ date +  '</td>'+
							    						'<td style="text-align: center">'+data.status.substr(0,1).toUpperCase()+data.status.substr(1)+'</td>'+
							    					'</tr>';

								jQuery(".responseReturnData").append(tableReturnData);
							});

							jQuery(".returnHistory").show();
							jQuery(".tableReturnData").show();
	            		}
	            		else{
	            			jQuery(".returnHistory").hide();
							jQuery(".tableReturnData").hide();
	            		}

	            	}else{
	            		jQuery(".errorReport").show();
	            		jQuery(".errorReport").html('<span style="color:red;">' + response.errorMessage + '</span>')

	            		jQuery(".customerName").hide()
	            		jQuery(".orderDate").hide();
	            		jQuery(".tableData").hide();

	            		jQuery(".returnHistory").hide();
						jQuery(".tableReturnData").hide();
	            	}
	            }
	        });
		}
	});
});

jQuery(document).keyup(function(e) {
    if (e.keyCode == 27) { // Esc
        jQuery('.popup').fadeOut(350);
        jQuery("#save_return").find('input[type=text], input[type=number], input[type=file], textarea').val('');
    }
});

jQuery(document).on("change", ".return_type", function(){
	var note = jQuery(this).find(':selected').attr('data-note');
	jQuery(".returnNote").html(note)
})

jQuery(document).on('click', '[data-popup-open]', function(e) {
	e.preventDefault();
	var targeted_popup_class = jQuery(this).attr('data-popup-open');
	jQuery('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);	
});

//----- CLOSE
jQuery(document).on('click', '[data-popup-close]', function(e) {
	e.preventDefault();
	var targeted_popup_class = jQuery(this).attr('data-popup-close');
	jQuery('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);
	jQuery("#save_return").find('input[type=text], input[type=number], input[type=file], textarea').val('');
});

// NOTE POPUP

jQuery(document).on('click', '[data-popup-open-note]', function(e) {
	e.preventDefault();
	var targeted_popup_class = jQuery(this).attr('data-popup-open-note');
	jQuery('[data-popup-note="' + targeted_popup_class + '"]').fadeIn(350);	
});

//----- CLOSE
jQuery(document).on('click', '[data-popup-close-note]', function(e) {
	e.preventDefault();
	var targeted_popup_class = jQuery(this).attr('data-popup-close-note');
	jQuery('[data-popup-note="' + targeted_popup_class + '"]').fadeOut(350);
});


/*jQuery(document).on("click", ".requestReturn", function(e){*/
jQuery(document).on("submit", "#save_return", function(e){
	e.preventDefault();
	var quantity = jQuery(".quantity").val()
	var max_quantity = jQuery(".quantity").attr('data-max_quantity');

	/*if(quantity == ''){
		alert("Please enter quantity that you want to return!");
		jQuery(".quantity").focus();
	}else if(quantity > max_quantity){
		alert("You can select maximum "+ max_quantity+" quantity!");
		jQuery(".quantity").focus();
	}else{*/
		
		/*var formData = jQuery("#save_return").serialize();
		var data = new FormData();
		var files = $("#customer_attachment").get(0).files;

		formData = jQuery("#save_return").serialize() + '&customer_attachment=' + files;*/
		//console.log(formData);return false;
		//alert();return false;
		var formData = new FormData(this);

		jQuery(".requestReturn").html('');
    	jQuery(".requestReturn").html('<i class="fa fa-spinner fa-spin"></i>&nbsp;&nbsp;Loading...');

		jQuery.ajax({
			enctype: 'multipart/form-data',
            url: baseUrl + "/returncall/addRmaAction",
            type: "POST",
            dataType: 'json',
            data: formData,
            contentType: false,
            processData: false,
            success: function (response) {
            	//console.log(response.content)
                if(response.status == true){

                	jQuery(".requestReturn").html('');
    				jQuery(".requestReturn").html('<i class="fa fa-check"></i>&nbsp; Submit');

                	jQuery('.popup').fadeOut(350);

                	jQuery("#orderForm").scrollTop(0)

                	jQuery("body .successmessage").css('color', '#20A261');
                	jQuery("body .successmessage").show();
                	jQuery("body .successmessage").html(response.content);

                	jQuery("body .postOrderLookup").trigger( "click" );

                }else{

                	jQuery("#customer_attachment").after('<br/><div class="errorAttachment" style="display:none; color:red;"></div>');

                	jQuery(".errorAttachment").show();
	            	jQuery(".errorAttachment").html(response.errorMessage)
                }
            }
        });

	//}
})

function showLoading(){
	jQuery(".postOrderLookup").html('');
    jQuery(".postOrderLookup").html('<i class="fa fa-spinner fa-spin"></i>&nbsp;&nbsp;Loading...');
}

function hideLoading(){
	jQuery(".postOrderLookup").html('');
    jQuery(".postOrderLookup").html('Look Up');
}