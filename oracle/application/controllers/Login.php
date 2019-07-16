<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Login extends CI_Controller {

    function __construct() {

        parent::__construct();
        $this->load->model('loginm', 'auth');
        $this->load->model('charges_model', 'charges');
    }

    public function index() {

        //ini_set('display_errors', 1);
        if ($this->input->get('code')) {
            
            $code = $this->input->get('code');
            $shop = $this->input->get('shop');
            $params = array('shop_domain' => $shop, 'token' => '', 'api_key' => API_KEY, 'secret' => SECRET);
            $this->load->library('shopifyapi', $params);
            $token = $this->shopifyapi->getAccessToken($code);
           
            if ($token != '') {
                $this->session->set_userdata('token', $token);
                $this->session->set_userdata('shop', $shop);
                $getstore = $this->auth->checkStore($shop, $token);
                
                if (!$getstore) {
                    $data = array('shop_url' => $shop, 'token' => $token, 'created_at' => date('Y:m:d H:i:s'), 'status' => 1);
                    $this->auth->setStore($data);
                    
                    $getstore = $this->auth->checkStore($shop, $token);
                    $this->session->set_userdata('store', $getstore);
                    
                } else {
                    $this->auth->UpdateToken($shop, $token, 1);
                    $getstore = $this->auth->checkStore($shop, $token);
                    $this->session->set_userdata('store', $getstore);
                }
                //redirect('login/getcharges');
            }
            redirect('homepage');
            exit;
        } else if ($this->input->post('shop') || ($this->input->get('shop'))) {
            $shop = $this->input->post('shop') ? $this->input->post('shop') : $this->input->get('shop');
            $params = array('shop_domain' => $shop, 'token' => '', 'api_key' => API_KEY, 'secret' => SECRET);
            $this->load->library('shopifyapi', $params);

            //get the URL to the current page
            $pageURL = base_url('login');
            redirect($this->shopifyapi->getAuthorizeUrl(SHOPIFY_SCOPE, $pageURL));
            exit;
        }
        $data['title'] = 'Oracle';
        $this->load->view('login', $data);
    }
    
    function logout(){
        $this->session->sess_destroy();
        redirect('/');
    }
    
    function getcharges(){
        $shop = $this->session->userdata('shop');
        $token = $this->session->userdata('token');
        
        $charges = $this->charges->getRecurringCharge();
        
        if(!$charges){
            
            $params = array('shop_domain'=>$shop, 'token'=>$token, 'api_key'=>API_KEY, 'secret'=>SECRET);
            $this->load->library('shopifyapi', $params);
            
            $data = array("recurring_application_charge"=> 
                        array(
                            "name"=> "Oracle", 
                            "price"=> 9.99, 
                            "return_url"=> base_url()."index.php/charges",
                            "trial_days"=> 7,
                            "test"=> true
                        )
                    );
           
            try{
                
                $result = $this->shopifyapi->call('POST', '/admin/recurring_application_charges.json',$data);
                
                $this->charges->setRecurringCharge($result);
                redirect($result['confirmation_url']);
                
            } catch (ShopifyApiException $e) {
                pre($e->getResponse());exit;
            }
        } else{
            if($charges->status == 'pending'){
                redirect($charges->confirmation_url);
            }
        }
        redirect('/');
    }
}
