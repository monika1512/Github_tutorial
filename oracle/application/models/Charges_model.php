<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

Class Charges_model extends CI_Model {

    function __construct() {
        parent::__construct();
    
    }
    function getRecurringCharge(){
        
    	$this->db->select('*');
    	$this->db->where('store',getstore('id'));
    	$query = $this->db->get('recurringcharges');
    	return $query->row();
    }
    
    function setRecurringCharge($data){
        
    	$charge_data = array(
            'store'=> getstore('id'),
            'charge_id'=> $data['id'],
            'name'=> $data['name'],
            'api_client_id'=> $data['api_client_id'],
            'price'=> $data['price'],
            'status'=> $data['status'],
            'return_url'=> $data['return_url'],
            'billing_on'=> date('Y-m-d H:i:s', strtotime($data['billing_on'])),
            'created_at'=> date('Y-m-d H:i:s', strtotime($data['created_at'])),
            'updated_at'=> date('Y-m-d H:i:s', strtotime($data['updated_at'])),
            'test'=> $data['test'],
            'activated_on'=> $data['activated_on'],
            'trial_ends_on'=> $data['trial_ends_on'],
            'cancelled_on'=> $data['cancelled_on'],
            'trial_days'=> $data['trial_days'],
            'decorated_return_url'=> $data['decorated_return_url'],
            'confirmation_url'=> $data['confirmation_url'],
            'created_date'=> date('Y-m-d H:i:s'),
            'updated_date'=> date('Y-m-d H:i:s')
        );
    	$this->db->insert('recurringcharges',$charge_data);
    	return true;
    }

    function updateRecurringCharge($data){
        
    	$charge_data = array(
            'charge_id'=> $data['id'],
            'name'=> $data['name'],
            'api_client_id'=> $data['api_client_id'],
            'price'=> $data['price'],
            'status'=> $data['status'],
            'return_url'=> $data['return_url'],
            'billing_on'=> date('Y-m-d H:i:s', strtotime($data['billing_on'])),
            'created_at'=> date('Y-m-d H:i:s', strtotime($data['created_at'])),
            'updated_at'=> date('Y-m-d H:i:s', strtotime($data['updated_at'])),
            'test'=> $data['test'],
            'activated_on'=> $data['activated_on'],
            'trial_ends_on'=> $data['trial_ends_on'],
            'cancelled_on'=> $data['cancelled_on'],
            'trial_days'=> $data['trial_days'],
            'decorated_return_url'=> $data['decorated_return_url'],
            'updated_date'=> date('Y-m-d H:i:s')
        );
    	
    	$this->db->where('charge_id',$charge_data['charge_id']);
    	$result = $this->db->update('recurringcharges',$charge_data);
    	return $result;
    }
    
    function remove_data($store, $chargeid){
        $this->db->where('store', $store);
        $this->db->where('charge_id', $chargeid);
        $this->db->delete('recurringcharges');
    }
    
    function uninstall($shop){
        
        $this->db->where('shop_url', $shop);
        $data = array('status'=> 0);
        $this->db->update('shop', $data);
    	return true;
    }
}