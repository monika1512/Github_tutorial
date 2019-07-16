<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Import extends CI_Controller {
 
 public function __construct()
 {
  parent::__construct();
  $this->load->model('Import_model');
  $this->load->library('csvimport');
 }

 function index()
 {
  $this->load->view('csv_import');
 }

 function load_data()
 {
  $result = $this->Import_model->select();
  $output = '
   <h3 align="center">Imported Student Information from CSV File</h3>
        <div class="table-responsive">
         <table class="table table-bordered table-striped">
          <tr>
           <th>Sr.No</th>
           <th>Student First Name</th>
           <th>Student Last Name</th>
           <th>Student Mobile</th>
           <th>Student Email</th>
          </tr>
  ';
  $count = 0;
  if($result->num_rows() > 0)
  {
   foreach($result->result() as $row)
   {
    $count = $count + 1;
    $output .= '
    <tr>
     <td>'.$count.'</td>
     <td>'.$row->studfname.'</td>
     <td>'.$row->studlname.'</td>
     <td>'.$row->stud_mobile.'</td>
     <td>'.$row->email.'</td>
    </tr>
    ';
   }
  }
  else
  {
   $output .= '
   <tr>
       <td colspan="5" align="center">any student Data not Available</td>
      </tr>
   ';
  }
  $output .= '</table></div>';
  echo $output;
 }
 
 function import()
 {
  $file_data = $this->csvimport->get_array($_FILES["csv_file"]["tmp_name"]);
  foreach($file_data as $row)
  {
   $data[] = array(
        'id' => $row["Sr.No"],
        'studfname' => $row["studfname"],
        'studlname'  => $row["studlname"],
        'stud_mobile'   => $row["stud_mobile"],
        'email'   => $row["email"]
   );
  }
  $this->Import_model->insert($data);
 }
}