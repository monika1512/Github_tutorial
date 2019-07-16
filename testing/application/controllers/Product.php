<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Product extends CI_Controller {

    function __construct(){
        //ini_set('display_errors', 1);
        parent::__construct();
        $this->load->helper('url');  
        $this->load->model('Main_Model');
       
    }

    public function index(){
        
     $array = array(
          array('Last Name', 'First Name', 'Gender'),
          array('Furtado', 'Nelly', 'female'),
          array('Twain', 'Shania', 'female'),
          array('Farmer', 'Mylene', 'female')
        );
         
        $this->load->helper('csv');
        echo array_to_csv($array,'mona.csv');
    }
    
    

}