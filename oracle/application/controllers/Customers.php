<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Customers extends CI_Controller {

    function __construct(){
        //ini_set('display_errors', 1);
        parent::__construct();
        $this->load->model('loginm', 'auth');
        $this->load->model('homem', 'home');
        $this->load->model('customersm');
        $this->load->model('charges_model', 'charges');
        if ($this->session->userdata('token') == FALSE) redirect('login');
    }

    public function index(){
        
        $statusdata = array();
        $shop = $this->session->userdata('shop');
        
        $data['title'] = 'Customers | Oracle';
        
        $this->load->view('header', $data);
        $this->load->view('customers', $data);
        $this->load->view('footer');
    }
    
    public function countcustomers(){
        $this->load->library('csvreader');
        $results = $this->csvreader->parse_file('/var/www/html/shopify/oracle/dump/final_orders_and_customers.csv');
        $tempcustomers = $customers = [];
        $countryarray = [
            'United States of America'=>'US',
            'Canada'=>'CA',
            'Australia'=>'AU',
        ];
        
        foreach ($results as $result):
            
            if(!in_array($result['EmailID'], $tempcustomers)){
                $tempcustomers[$result['EmailID']] = $result;
            }
            
        endforeach;
        foreach ($tempcustomers as $tempcustomer):
            $customers[] = $tempcustomer;
        endforeach;
        $customers = ['count'=>count($customers)];
        echo json_encode($customers);
    }
    
    public function upload(){
        
        $shopid = $this->uri->segment(3, 0);
        if($shopid){
            $currentsyncno = $this->customersm->getcronsync($shopid);
            $currentsyncno = $currentsyncno->tasksyncno;
        }else{
            $shopid = getstore('id');
            $currentsyncno = $this->input->post('currentsyncno');
        }
        
        $getstore = $this->auth->getstore($shopid);
        
        $lastsync = $currentsyncno;
        $finishsyncno = $currentsyncno+5;
        
        $resultdata = [];
        $status = 'finish';
        $this->load->library('csvreader');
        $results = $this->csvreader->parse_file('/var/www/html/shopify/oracle/dump/final_orders_and_customers.csv');
        $tempcustomers = $customers = [];
        $countryarray = getcountries();
        
        foreach ($results as $result):
            
            if(!in_array($result['EmailID'], $tempcustomers)){
                $tempcustomers[$result['EmailID']] = $result;
            }
            
        endforeach;
        foreach ($tempcustomers as $tempcustomer):
            $customers[] = $tempcustomer;
        endforeach;
        
        if($shopid){
            $shop = $getstore->shop_url;
            $token = $getstore->token;
        }else{
            $shop = $this->session->userdata('shop');
            $token = $this->session->userdata('token');
        }
        
        $params = array('shop_domain'=>$shop, 'token'=>$token, 'api_key'=>API_KEY, 'secret'=>SECRET);
        $this->load->library('shopifyapi', $params);
        
        $newpass = date('YmdH');
        foreach ($customers as $j=>$customer):
            
            if ($j < $currentsyncno) {
                continue;
            }
            if ($j == $finishsyncno) {
                break;
            }
            
            $getdbcustomer = $this->customersm->getcustomerbyshopifyemail($customer['EmailID'], $shopid);
            if(isset($getdbcustomer->shopifyid)){
                
                $resultdata[$j]['status'] = 'error';
                $resultdata[$j]['message'] = $customer['EmailID'].' already sync with shopify customer id : '.$getdbcustomer->shopifyid;
                $data = ['email'=>$customer['EmailID'], 'csvrowid'=>$j, 'error'=>$resultdata[$j]['message']];
                $this->customersm->addcustomererror($data, $shopid);
                continue;
            }
            if(!isset($countryarray[$customer['Country']])){
                $resultdata[$j]['status'] = 'error';
                $resultdata[$j]['message'] = $customer['Country'].' country not available in shopify.';
                $data = ['email'=>$customer['EmailID'], 'csvrowid'=>$j, 'error'=>$resultdata[$j]['message']];
                $this->customersm->addcustomererror($data, $shopid);
                continue;
            }
            
            
            $lastsync += 1;
            $status = 'continue';
            $data = array(
                'customer'=> array(
                    'email'=>$customer['EmailID'],
                    'first_name'=>$customer['FirstName'],
                    'last_name'=>$customer['LastName'],
                    'phone'=>$customer['Phone'],
                    "verified_email"=> true,
                    "send_email_welcome"=> false,
                    "password"=> $newpass,
                    "password_confirmation"=> $newpass,
                    'addresses' => array(
                        0=>array(
                            'address1'=>$customer['Address'],
                            'city'=>$customer['City'],
                            'province'=>$customer['State'],
                            "phone"=> $customer['Phone'],
                            'country'=>$countryarray[$customer['Country']],
                            'zip'=>$customer['Zip'],
                            'default'=>true
                        )
                    )
                )
            );
            
            try{
                
                $cus = $this->shopifyapi->call('POST', '/admin/customers.json', $data);
                if(isset($cus['email'])){
                    $data = ['email'=>$cus['email'], 'shopifyid'=>$cus['id'], 'shopifyaddressid'=>$cus['default_address']['id']];
                    $this->customersm->addcustomer($data, $shopid);
                    
                    $resultdata[$j]['status'] = 'success';
                    $resultdata[$j]['message'] = $cus['email'].' Synced';
                }
                
            } catch (ShopifyApiException $e) {
                
                $msg = $e->getResponse();
                $errormsg = $customer['FirstName'].' '.$customer['LastName'].' : ';
                if(isset($msg['errors'])){
                    $k = 0;
                    foreach ($msg['errors'] as $key=>$errors):
                        
                        if($k > 0){
                            $errormsg .= ', ';
                        }
                        $errormsg .= $key;
                        foreach ($errors as $error):
                            $errormsg .= ' '.$error;
                        endforeach;
                        $k++;
                    endforeach;
                }
                $resultdata[$j]['status'] = 'error';
                $resultdata[$j]['message'] = $errormsg;
                $data = ['email'=>$customer['EmailID'], 'csvrowid'=>$j, 'error'=>$errormsg];
                $this->customersm->addcustomererror($data, $shopid);
            }
            
        endforeach;
        $customers = ['status'=>$status,'lastsync'=>$lastsync, 'customerlist'=> $resultdata];
        echo json_encode($customers);
    }

}