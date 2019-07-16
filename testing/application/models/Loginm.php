<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

Class Loginm extends CI_Model {

    function __construct() {

        parent::__construct();
    }
    
    function getstore($id){
        $this->db->select('*');
        $this->db->where('id', $id);
        $query = $this->db->get('shop');
        return $query->row();
    }

    function getAllStore() {

        $this->db->select('*');

        $query = $this->db->get('shop');

        return $query->result();
    }

    function setStore($data) {

        $this->db->insert('shop', $data);

        return $this->db->insert_id();
    }

    function checkStore($shop) {

        $this->db->select('*');

        $this->db->where('shop_url', $shop);

        $query = $this->db->get('shop');

        return $query->row();
    }

    function updateStoreData($shop, $token, $data) {

        $this->db->where('token', $token);

        $this->db->update('shop', $data);

        return true;
    }

    function UpdateToken($shop, $token, $status) {

        $this->db->where('shop_url', $shop);

        $data = array('token' => $token, 'status' => $status);

        $this->db->update('shop', $data);

        return true;
    }
	
	
	function isAvailablee($aid)
	{		
			
		$this->db->select('articleid');
		$this->db->where('articleid',$aid);
		//$this->db->where('productid',$pid);
        $query=$this->db->get('article');	
		$row=$query->num_rows();
		
           if($row > 0 ){		      
			   echo 'false';  
                           
           } else {		     
		       echo 'true';                     
           }	
			
	}

}
