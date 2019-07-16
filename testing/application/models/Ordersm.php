<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

Class Ordersm extends CI_Model {

    function __construct() {
        parent::__construct();
    }
   
    function getcronsync($id = 0){
        $id = ($id == 0)?getstore('id'):$id;
        $this->db->select('*');
        $this->db->where('taskname', 'order');
        $this->db->where('store', $id);
        $query = $this->db->get('cronsync');
        return $query->row();
    }
    
    function updatecronsync($tasksyncno, $id = 0){
        $id = ($id == 0)?getstore('id'):$id;
        $this->db->set('tasksyncno', $tasksyncno);
        $this->db->where('taskname', 'order');
        $this->db->where('store', $id);
        $this->db->update('cronsync');
        return true;
    }
    
    function addorder($data, $id = 0){
        
        $id = ($id == 0)?getstore('id'):$id;
        $check = $this->checkorder($data['csvorderid'], $id);
        if(!isset($check->csvorderid)){
            $data['store'] = $id;
            $this->db->insert('orders', $data);
        }
    }
    
    function checkorder($csvorderid, $id){
        $this->db->select('*');
        $this->db->where('csvorderid', $csvorderid);
        $this->db->where('store', $id);
        $query = $this->db->get('orders');
        return $query->row();
    }
    
    function addordererror($data, $id = 0){
        $id = ($id == 0)?getstore('id'):$id;
        $check = $this->getordererrorbycsvorderid($data['csvorderid'], $id);
        if(!isset($check->csvrowid)){
            $this->removeordererror($data['csvorderid'], $id);
            $data['store'] = $id;
            $this->db->insert('ordersyncerror', $data);
        }
    }
    
    function getordererrorbycsvorderid($csvorderid, $id){
        $this->db->select('*');
        $this->db->where('csvorderid', $csvorderid);
        $this->db->where('store', $id);
        $query = $this->db->get('ordersyncerror');
        return $query->row();
    }
    
    function removeordererror($csvorderid, $id){
        $this->db->where('csvorderid', $csvorderid);
        $this->db->where('store', $id);
        $this->db->delete('ordersyncerror');
    }

    function addtemporder($data){
        if($this->db->insert('synctemporder',$data)){
    return true;
             
        }else{

              return false; }
       
    }
     function checktemporder($csvorderid){
        $this->db->select('*');
        $this->db->where('name', $csvorderid);
        //$this->db->where('store', $id);
        $query = $this->db->get('synctemporder');
        $query->row();
        // echo $this->db->last_query();
        // exit();
    }
    
}
