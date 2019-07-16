<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

Class Customersm extends CI_Model {

    function __construct() {
        parent::__construct();
    }
    
    function getcronsync($id = 0){
        $id = ($id == 0)?getstore('id'):$id;
        $this->db->select('*');
        $this->db->where('taskname', 'customer');
        $this->db->where('store', $id);
        $query = $this->db->get('cronsync');
        return $query->row();
    }
   
    function getcustomer($id, $store = 0){
        
        $store = ($store == 0)?getstore('id'):$store;
        $this->db->select('*');
        $this->db->where('id', $id);
        $this->db->where('store', $store);
        $query = $this->db->get('customers');
        return $query->row();
    }
    
    function getcustomerbyshopifyid($id, $store = 0){
        
        $store = ($store == 0)?getstore('id'):$store;
        $this->db->select('*');
        $this->db->where('shopifyid', $id);
        $this->db->where('store', $store);
        $query = $this->db->get('customers');
        return $query->row();
    }
    
    function getcustomerbyshopifyemail($email, $store = 0){
        $store = ($store == 0)?getstore('id'):$store;
        $this->db->select('*');
        $this->db->where('email', $email);
        $this->db->where('store', $store);
        $query = $this->db->get('customers');
        return $query->row();
    }
    
    function addcustomer($data, $store = 0){
        $store = ($store == 0)?getstore('id'):$store;
        $check = $this->getcustomerbyshopifyemail($data['email'], $store);
        if(!isset($check->email)){
            $data['store'] = $store;
            $this->db->insert('customers', $data);
        }
    }
    
    function addcustomererror($data, $store = 0){
        $store = ($store == 0)?getstore('id'):$store;
        
        $check = $this->getcustomererrorbyshopifyemail($data['email'], $store);
        if(!isset($check->email)){
            $this->removecustomererror($data['email'], $store);
            $data['store'] = $store;
            $this->db->insert('customersyncerror', $data);
        }
    }
    
    function getcustomererrorbyshopifyemail($email, $store){
        $this->db->select('*');
        $this->db->where('email', $email);
        $this->db->where('store', $store);
        $query = $this->db->get('customersyncerror');
        return $query->row();
    }
    
    function removecustomererror($email, $store){
        
        $this->db->where('email', $email);
        $this->db->where('store', $store);
        $this->db->delete('customersyncerror');
    }

    // Function to insert customer data
    public function customer_data($data = array()) {

        $exist = $this->get_customer_data($data['id']);

        if(empty($exist)) {

            $inserted = $this->db->insert('customer_data', $data);
            if($inserted) { return true; }

        } else {

            $updated = $this->db->where('id', $exist->id)->update('customer_data', $data);
            if($updated) { return true; }
        }
    }

    // Function to get customer data
    public function get_customer_data($id = '') {

        $qry = $this->db->select('id')->where('id', $id)->get('customer_data');
        // return $qry->num_rows();
        return $qry->row();
    }

    // Function to insert customer addresses
    public function customer_addresses($data = array()) {

        $exist = $this->get_customer_addresses($data['id']);

        if(empty($exist)) {

            $inserted = $this->db->insert('customer_addresses', $data);
            if($inserted) { return true; }

        } else {

            $updated = $this->db->where('id', $exist->id)->update('customer_addresses', $data);
            if($updated) { return true; }
        }
    }

    // Function to get customer addresses
    public function get_customer_addresses($id = '') {

        $qry = $this->db->where('id', $id)->get('customer_addresses');
        // return $qry->num_rows();
        return $qry->row();
    }
    
    public function order_data($data = array()) {
        $exist = $this->get_order_data($data['orderid']);

        if(empty($exist)) {

            $inserted = $this->db->insert('getorder_data', $data);
            if($inserted) { return true; }

        } else {

            $updated = $this->db->where('orderid', $exist->orderid)->update('getorder_data', $data);
            if($updated) { return true; }
        }
    }
    
    // Function to get customer data
    public function get_order_data($id = 0) {

        $qry = $this->db->select('orderid')->where('orderid', $id)->get('getorder_data');
        return $qry->row();
    }
    
    function updatecronsync($tasksyncno){
        $this->db->set('tasksyncno', $tasksyncno);
        $this->db->where('taskname', 'order');
        $this->db->where('store', 1);
        $this->db->update('cronsync');
        return true;
    }
    
    function updatecronsynccustomer($tasksyncno){
        $this->db->set('tasksyncno', $tasksyncno);
        $this->db->where('id', 2);
        $this->db->update('cronsync');
        return true;
    }
    
    function getordercronsync(){
        $this->db->select('*');
        $this->db->where('id', 1);
        $query = $this->db->get('cronsync');
        return $query->row();
    }
    function getordercronsyncusto(){
        $this->db->select('*');
        $this->db->where('id', 2);
        $query = $this->db->get('cronsync');
        return $query->row();
    }
}
