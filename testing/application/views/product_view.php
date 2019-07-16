<?php

defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!DOCTYPE html>
<html lang="en">
 <head> 
   <meta charset="utf-8"> 
   <title>Export MySQL data to CSV file in CodeIgniter</title>
 </head>
 <body>
   <!-- Export Data --> 
   <a href='<?= base_url() ?>/Product/exportocvs'>Export</a><br><br>

   <!-- User Records --> 
   <table border='1' style='border-collapse: collapse;'> 
     <thead> 
      <tr> 
       <th>productid</th> 
       <th>roomleid</th>       
      </tr> 
     </thead> 
     <tbody> 
     <?php
     foreach($productsData as $key=>$val){ 
       echo "<tr>"; 
       echo "<td>".$val['productid']."</td>"; 
       echo "<td>".$val['roomleid']."</td>"; 
      
       echo "</tr>"; 
      } 
      ?> 
     </tbody> 
    </table>
  </body>
</html>