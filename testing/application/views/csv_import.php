
<html>
<head>
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet"  href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"  />
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
</head>
<body>
 <div class="container box">
  <h3 align="center">How to Import CSV Data into Mysql using Codeigniter</h3>
  <br />
<!-- Devloped by Pakainfo.com free download examples -->
  <form method="post" id="csv_import_ci" enctype="multipart/form-data">
   <div class="form-group">
    <label>Select CSV File</label>
    <input type="file" name="csv_file" id="csv_file" required accept=".csv" />
   </div>
   <br />
<!-- Devloped by Pakainfo.com free download examples -->
   <button type="submit" name="csv_import_ci" class="btn btn-info" id="csv_import_ci_btn">Import CSV</button>
  </form>
  <br />
  <div id="imported_csv_data"></div>
 </div>
</body>
</html>

<script>
$(document).ready(function(){

 load_data();

 function load_data()
 { 
   alert('loading'); 
   $.ajax({
   url:"<?php echo base_url(); ?>import/load_data",
   method:"POST",
   success:function(data)
   {
    $('#imported_csv_data').html(data);
   }
  })
 }

 $('#csv_import_ci').on('submit', function(event){
  event.preventDefault();
  
  //call ajax
  $.ajax({
   url:"<?php echo base_url(); ?>import/import",
   method:"POST",
   data:new FormData(this),
   contentType:false,
   cache:false,
   processData:false,
   beforeSend:function(){
    $('#csv_import_ci_btn').html('Data Importing...');
   },
   success:function(data)
   {
    $('#csv_import_ci')[0].reset();
    $('#csv_import_ci_btn').attr('disabled', false);
    $('#csv_import_ci_btn').html('Import Done');
    load_data();
   }
  })
 });
 
});
</script>