<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

Class Homem extends CI_Model {

    function __construct() {
        parent::__construct();
    }
   
    function getPopup(){
        $this->db->select('*');
        $this->db->where('store', getstore('id'));
        $query = $this->db->get('shop_popup');
        return $query->row();
    }
    function SetPopup($data){
        $data['store'] = getstore('id');
        $data['created_at'] = date('Y-m-d H:i:s');
        $this->db->insert('shop_popup', $data);
    }
    
    function updatePopup($data){
        $check = $this->checkPopup();
        if($check > 0){
            $data['updated_at'] = date('Y-m-d H:i:s');
            
            $this->db->where('store', getstore('id'));
            $this->db->update('shop_popup', $data);
            return true;
        }else{
            $this->SetPopup($data);
        }
        return true;
    }
    function checkPopup(){
        $this->db->select('*');
        $this->db->where('store', getstore('id'));
        return $this->db->get('shop_popup')->num_rows();
    }
}
