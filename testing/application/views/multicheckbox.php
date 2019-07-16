<head>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
    rel="stylesheet" type="text/css" />
<link href="http://localhost/shopify/monika/assets/css/custom.css" rel="stylesheet" type="text/css" />    
<script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
    type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $('#lstFruits').multiselect({
            includeSelectAllOption: true
        });
    });
</script>
<style>
.custag{
  display: none; 
  width: 50px;
}
.cust_tagval{
  display: none;
}
</style>

</head>

<body>
<select id="lstFruits" multiple="multiple">
    <option value="Mango">Mango</option>
    <option value="Apple">Apple</option>
    <option value="Banana">Banana</option>
    <option value="Guava">Guava</option>
    <option value="Orange">Orange</option>
</select>
<input type="button" id="btnSelected" value="Get Selected" /><br><br>

<table id="dtBasicExample" class="table-striped table-bordered" cellspacing="0" >
  <thead>
    <tr>
       
        <td .col-sm-4 >Name</td>        
        <td .col-sm-4 >Surname</td>
        <?php  $customer_tag = array("Mango", "Apple", "Banana","Guava","Orange");

          foreach($customer_tag AS $key_t=>$val_t) { ?> 
                            <td class="product_td product_val custag cth_<?php echo $val_t;?>">                              
                              <?php echo $val_t;?>
                            </td>
        <?php } ?> 
       
    </tr>
  </thead>
  <tbody>
    <tr>
        <td>Monika</td>
        <td>Patel</td>
                <?php foreach($customer_tag AS $key_t=>$val_t) { ?> 
                            <td class="product_td product_val  custag ct_<?php echo $val_t;?>">                              
                             <input type="number"  name="tag_<?php echo $val_t;?>[]" value="{{pro.<?php echo $val_t;?>}}" class="tag_<?php echo $val_t;?> form-control" min="0" step="any"/>
                <?php } ?>              
          </td>
        
      
    </tr>
     <tr>
        <td>Hemal</td>
        <td>Patel</td>
                <?php foreach($customer_tag AS $key_t=>$val_t) { ?> 
                            <td class="product_td product_val  custag ct_<?php echo $val_t;?>">                              
                             <input type="number"  name="tag_<?php echo $val_t;?>[]" value="{{pro.<?php echo $val_t;?>}}" class="tag_<?php echo $val_t;?> form-control" min="0" step="any"/>
                <?php } ?>              
          </td>
        
      
    </tr>
  </tfoot>
</table>


<script type="text/javascript">
    $('#lstFruits').click(function () {
        var selected = $("#lstFruits option:selected");
        var message = "";
        selected.each(function () {
            message += $(this).text() + " " + $(this).val() + "\n";
        });
        alert(message);
    });

    $('#lstFruits').on('change',function() {
          
            var tag = $(this).val();
            if(tag != null){
                 var areaofinterest = '';
                  $('#lstFruits :selected').each(function(i, sel){ 
                        var comma = areaofinterest.length===0 ? '' : ',';
                        areaofinterest += (comma+sel.value);
                  });
                 
                 var arr = areaofinterest.split(',');               

                 $('.custag').hide();
                 $.each( arr, function(key, value ) {                                 
                    
                      $('.cth_'+value).show();
                      $('.ct_'+value).show();
                 });
           
            }else{
                $('.custag').hide();
            }
           
          });
         
          // function getTags(){
          //      var tag = $('#lstFruits').val();               
          //       if(tag != null){
          //            var areaofinterest = '';
          //             $('#lstFruits :selected').each(function(i, sel){ 
          //                   var comma = areaofinterest.length===0 ? '' : ',';
          //                   areaofinterest += (comma+sel.value);
          //             });
                     
          //            var arr = areaofinterest.split(',');

          //            $('.custag').hide();
          //            $.each( arr, function( key, value ) {

          //                 $('.cth_'+value).show();
          //                 $('.ct_'+value).show();
          //            });
               
          //       }else{
          //           $('.custag').hide();
          //       }
          // }                                               


     

</script>
</body>














<!-- <!DOCTYPE html>
<html>
<head>

    <link href="css/jquery.multiselect.css" rel="stylesheet" type="text/css">

</head>

<body>

<h2>A demo of using multi-select with checkboxes</h2>
    <select name="multicheckbox[]" multiple="multiple" class="4colactive">
        <option value="AK">Alaska</option>
        <option value="AZ">Arizona</option>
        <option value="AR">Arkansas</option>
        <option value="CA">California</option>
        <option value="CO">Colorado</option>
        <option value="CT">Connecticut</option>
        <option value="DE">Delaware</option>
        <option value="FL">Florida</option>
        <option value="GA">Georgia</option>
        <option value="HI">Hawaii</option>
        <option value="ID">Idaho</option>
        <option value="IL">Illinois</option>
        <option value="IN">Indiana</option>
        <option value="IA">Iowa</option>
        <option value="KS">Kansas</option>
        <option value="KY">Kentucky</option>
        <option value="LA">Louisiana</option>
        <option value="ME">Maine</option>
        <option value="MD">Maryland</option>
        <option value="MA">Massachusetts</option>
        <option value="MI">Michigan</option>
        <option value="MN">Minnesota</option>
        <option value="MS">Mississippi</option>
        <option value="MO">Missouri</option>
        <option value="MT">Montana</option>
        <option value="NE">Nebraska</option>
        <option value="NV">Nevada</option>
        <option value="NH">New Hampshire</option>
        <option value="NJ">New Jersey</option>
        <option value="NM">New Mexico</option>
        <option value="NY">New York</option>
        <option value="NC">North Carolina</option>
        <option value="ND">North Dakota</option>
        <option value="OH">Ohio</option>
        <option value="OK">Oklahoma</option>
        <option value="OR">Oregon</option>
        <option value="PA">Pennsylvania</option>
        <option value="RI">Rhode Island</option>
        <option value="SC">South Carolina</option>
        <option value="SD">South Dakota</option>
        <option value="TN">Tennessee</option>
        <option value="TX">Texas</option>
        <option value="UT">Utah</option>
        <option value="VT">Vermont</option>
        <option value="VA">Virginia</option>
        <option value="WA" selected="selected">Washington</option>
        <option value="WV">West Virginia</option>
        <option value="WI">Wisconsin</option>
        <option value="WY">Wyoming</option>
    </select>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
<script src="js/multiselect-checkbox/jquery.multiselect.js"></script>
<script>
$('select[multiple]').multiselect({
    columns: 2,
    placeholder: 'Select options'
});
</script>
</body>
</html> -->