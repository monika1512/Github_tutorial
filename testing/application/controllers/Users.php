<?php defined('BASEPATH') OR exit('No direct script access allowed');
class Products extends CI_Controller {
  public function __construct(){
   parent::__construct();
   
   // load base_url 
   $this->load->helper('url');
   
   // Load Model 
   $this->load->model('Main_model'); 
  } 

  public function index(){
   // get data $data = array(); 
   $data['productsData'] = $this->Main_model->getUserDetails();
   
   $this->load->view('product_view',$data); 
  }
 
  // Export data in CSV format 
  public function exportCSV(){ 
   // file name 
   $filename = 'users_'.date('Ymd').'.csv'; 
   header("Content-Description: File Transfer"); 
   header("Content-Disposition: attachment; filename=$filename"); 
   header("Content-Type: application/csv; ");
   
   // get data 
   $usersData = $this->Main_model->getUserDetails();

   // file creation 
   $file = fopen('php://output', 'w');
 
   $header = array("Productid","Rommleid"); 
   fputcsv($file, $header);
   foreach ($usersData as $key=>$line){ 
     fputcsv($file,$line); 
   }
   fclose($file); 
   exit; 
  }

  public function exportocvs(){ 
    //$this->load->database();
     $query = $this->Main_model->getproductDetails(); 
    // pre($query);exit;
    $this->load->helper('csv');
    //array_to_csv($array, 'toto.csv')
    echo query_to_csv($query, TRUE, 'totoo.csv');
 
 }


}