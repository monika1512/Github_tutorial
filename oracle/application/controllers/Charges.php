<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Charges extends CI_Controller {
    function __construct(){
        ini_set('display_errors', 1);
        parent::__construct();
        $this->load->model('charges_model', 'charges');
    }
    
    public function index(){
        
        if(isset($_GET['charge_id'])){
            $charge_id = $_GET['charge_id'];
            
            $shop = $this->session->userdata('shop');
            $token = $this->session->userdata('token');

             try {
                
                $params = array('shop_domain'=>$shop, 'token'=>$token, 'api_key'=>API_KEY, 'secret'=>SECRET);
                $this->load->library('shopifyapi', $params);
                
                $charges = $this->shopifyapi->call('GET', '/admin/recurring_application_charges/'.$charge_id.'.json');
                
                if($charges['status'] == 'declined'){
                    
                    $this->charges->remove_data(getstore('id'), $charge_id);
                    redirect('https://'.$shop.'/admin/apps');
                    
                }else if($charges['status'] == 'accepted'){
                    
                    $this->charges->updateRecurringCharge($charges);
                    
                    $data = array('recurring_application_charge'=>$charges);
                    
                    $activate = $this->shopifyapi->call('POST', '/admin/recurring_application_charges/'.$charge_id.'/activate.json',$data);
                    $this->charges->updateRecurringCharge($activate);
                    
                }else if($charges['status'] == 'active'){
                    
                    $this->charges->updateRecurringCharge($charges);
                    
                    $data = array('recurring_application_charge'=>$charges);
                    $activate = $this->shopifyapi->call('POST', '/admin/recurring_application_charges/'.$charge_id.'/activate.json',$data);
                    
                    $this->charges->updateRecurringCharge($activate);
                    
                }
                
            } catch (ShopifyApiException $e) {
                pre($e->getResponse());exit;
            }

        }
        redirect("/homepage");
    }
    
}