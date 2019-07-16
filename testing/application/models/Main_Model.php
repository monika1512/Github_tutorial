<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Main_model extends CI_Model {

  function getUserDetails(){
 
    $response = array();
 
    // Select record
    $this->db->select('productid,roomleid');
    $q = $this->db->get('product');
    $response = $q->result_array();
 
    return $response;
  }

  function getproductDetails(){ 
    // Select record
    $this->db->select('*');
    $q = $this->db->get('product');   
 
    return $q;
  }


}