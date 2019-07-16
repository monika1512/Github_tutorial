<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Orders extends CI_Controller {

    function __construct(){
        ini_set('display_errors', 0);
        ini_set('max_execution_time', '259200');
        ini_set('max_input_time', '259200');
        ini_set('memory_limit', '1000M');
        ini_set('upload_max_filesize', '1024M');
        ini_set('post_max_size', '1024M');
        parent::__construct();
        $this->load->model('loginm', 'auth');
        $this->load->model('homem', 'home');
        $this->load->model('customersm');
        $this->load->model('ordersm');

        if ($this->session->userdata('token') == FALSE) redirect('login');
    }

    public function index(){
        
        $statusdata = array();
        $shop = $this->session->userdata('shop');
        
        $data['title'] = 'Orders | Oracle';
        
        $this->load->view('header', $data);
        $this->load->view('orders', $data);
        $this->load->view('footer');
    }
    
    public function countorders(){
        $this->load->library('csvreader');
        $filename = '2015/Supplement 2015 Q1.csv';
        $file = getcwd().'/dump/newdata/ihf/'.$filename;
        $results = $this->csvreader->parse_file($file);
        $temporders = $orders = [];
        //pre($results);exit;
        foreach ($results as $k=>$result):
            
            if(!isset($temporders[$result['OrderID']])){
                
                $temporders[$result['OrderID']] = $result;
                $temporders[$result['OrderID']]['items'][] = [
                    'ProductID'=>$result['ProductID'],
                    'ProductName'=>$result['ProductName'],
                    'SKU'=>$result['SKU'],
                    'Quantity'=>$result['Quantity'],
                    'Price'=>$result['Price'],
                ];
                
            }else{
                $temporders[$result['OrderID']]['items'][] = [
                    'ProductID'=>$result['ProductID'],
                    'ProductName'=>$result['ProductName'],
                    'SKU'=>$result['SKU'],
                    'Quantity'=>$result['Quantity'],
                    'Price'=>$result['Price'],
                ];
            }
            
        endforeach;
        
        foreach ($temporders as $tempcustomer):
            $orders[] = $tempcustomer;
        endforeach;
        
        $orders = ['count'=>count($orders)];
        echo json_encode($orders);
    }
    
    public function upload(){
        
        $shopid = $this->uri->segment(3, 0);
        $getstore = [];
        if($shopid){
            $currentsyncno = $this->ordersm->getcronsync($shopid);
            $currentsyncno = $currentsyncno->tasksyncno;
        }else{
            $shopid = getstore('id');
            $currentsyncno = $this->input->post('currentsyncno');
        }
        $frequency = 30;
        $lastsync = $currentsyncno;
        $finishsyncno = $currentsyncno+$frequency;
        
        $resultdata = [];
        $status = 'finish';
        $this->load->library('csvreader');
        $filename = '2015/Supplement 2015 Q1.csv';
        $file = getcwd().'/dump/newdata/ihf/'.$filename;
        $results = $this->csvreader->parse_file($file);
        $temporders = $orders = [];
        
        foreach ($results as $k=>$result):
            
            if(!isset($temporders[$result['OrderID']])){
                
                $temporders[$result['OrderID']] = $result;
                $temporders[$result['OrderID']]['items'][] = [
                    'ProductID'=>$result['ProductID'],
                    'ProductName'=>$result['ProductName'],
                    'SKU'=>$result['SKU'],
                    'Quantity'=>$result['Quantity'],
                    'Price'=>$result['Price'],
                ];
                
            }else{
                $temporders[$result['OrderID']]['items'][] = [
                    'ProductID'=>$result['ProductID'],
                    'ProductName'=>$result['ProductName'],
                    'SKU'=>$result['SKU'],
                    'Quantity'=>$result['Quantity'],
                    'Price'=>$result['Price'],
                ];
            }
            
        endforeach;
        
        foreach ($temporders as $tempcustomer):
            $orders[] = $tempcustomer;
        endforeach;
        
        $resultdata = [];
        
        foreach ($orders as $j=>$order):
            
            if ($j < $currentsyncno) {
                continue;
            }
            if ($j == $finishsyncno) {
                break;
            }
            
            $order = json_decode(json_encode($order), true);
            //pre($order);exit;
            $lastsync += 1;
            $status = 'continue';
            $syncorder = $this->syncorder($order, $shopid, $j, $filename);
            $resultdata[] = $syncorder;
            //exit;
        endforeach;
        $this->ordersm->updatecronsync($lastsync, $shopid);
        
        $resultorders = ['status'=>$status,'lastsync'=>$lastsync, 'orderlist'=> $resultdata];
        echo json_encode($resultorders);
    }
    
    function syncorder($order, $shopid, $j, $filename){
        
//        $return['status'] = 'error';
//        $return['message'] = $order['OrderID'].' already sync with shopify order id : ';
//        return $return;
        
        $getstore = $this->auth->getstore($shopid);
        $getdborder = $this->ordersm->checkorder($order['OrderID'], $shopid);
        if(isset($getdborder->csvorderid)){
            $return['status'] = 'error';
            $return['message'] = $order['OrderID'].' already sync with shopify order id : '.$getdborder->ordername;
            return $return;
        }
        
        
        $countryarray = getcountries();
        //pre($countryarray);
        //echo $countryarray[$order['Country']];exit;
        $phonecodearray = getphonecode();
        if(!isset($countryarray[$order['Country']])){
            $return['status'] = 'error';
            $return['message'] = $order['Country'].' country not available in shopify';
            $data = ['csvorderid'=>$order['OrderID'], 'csvrowid'=>$j, 'errornote'=>$return['message'], 'filename'=>$filename];
            $this->ordersm->addordererror($data, $shopid);
            return $return;
        }
        
        if($shopid){
            $shop = $getstore->shop_url;
            $token = $getstore->token;
        }else{
            $shop = $this->session->userdata('shop');
            $token = $this->session->userdata('token');
        }
        
        $params = array('shop_domain' => $shop, 'token' => $token, 'api_key' => API_KEY, 'secret' => SECRET);
        $this->load->library('shopifyapi', $params);
        
        $processed_at = date("Y-m-d", strtotime($order['OrderDate'])).'T'.$order['OrderTime'].'-05:00';
        
        $syncorder = [];
        $syncorder['email'] = $order['EmailID'];
        $syncorder['processed_at'] = $processed_at;
        $syncorder['gateway'] = $order['Gateway'];
        $syncorder['total_price'] = $order['Total'];
        $syncorder['subtotal_price'] = $order['SubTotal'];
        $syncorder['total_weight'] = $order['Freight'];
        $syncorder['total_tax'] = $order['Tax'];
        $syncorder['taxes_included'] = false;
        $syncorder['total_discounts'] = $order['OrdersDiscount'];
        
        if($order['Status'] == 'Shipped'){
            $syncorder['financial_status'] = 'paid';
            $syncorder['fulfillment_status'] = 'fulfilled';
        }
        
        foreach ($order['items'] as $item):
            
            $line_items[] =  [
                'title' => $item['ProductName'],
                'quantity' => $item['Quantity'],
                'price' => $item['Price'],
                'sku' => $item['SKU']
            ];
            
        endforeach;
        
        $dbcustomer = $this->customersm->getcustomerbyshopifyemail($order['EmailID']);
        
        if($dbcustomer){
            $customer = ['id'=>$dbcustomer->shopifyid];
        }else{
            
            $phonecode = '';
            if(isset($phonecodearray[$order['Country']])){
                $phonecode = '+'.$phonecodearray[$order['Country']];
            }
            
            /*Customer*/
            $newpass = date('YmdHis');
            $data = array(
                'customer'=> array(
                    'email'=>$order['EmailID'],
                    'first_name'=>$order['FirstName'],
                    'last_name'=>$order['LastName'],
                    'phone'=>$phonecode.$order['Phone'],
                    "verified_email"=> true,
                    "send_email_welcome"=> false,
                    "password"=> $newpass,
                    "password_confirmation"=> $newpass,
                    'addresses' => array(
                        0=>array(
                            'address1'=>$order['Address'],
                            'city'=>$order['City'],
                            'province'=>$order['State'],
                            //"phone"=> $order['Phone'],
                            'country'=>$countryarray[$order['Country']],
                            'zip'=>$order['Zip'],
                            'default'=>true
                        )
                    )
                )
            );
            //pre($data);exit;
            try{
                
                $cus = $this->shopifyapi->call('POST', '/admin/customers.json', $data);
                if(isset($cus['email'])){
                    $data = ['email'=>$cus['email'], 'shopifyid'=>$cus['id'], 'shopifyaddressid'=>$cus['default_address']['id'], 'filename'=>$filename];
                    $this->customersm->addcustomer($data, $shopid);
                }
                $customer = ['id'=>$cus['id']];
                
            } catch (ShopifyApiException $e) {
                
                $msg = $e->getResponse();
                $errormsg = $order['FirstName'].' '.$order['LastName'].' : ';
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
                $return['status'] = 'error';
                $return['message'] = $errormsg;
                $data = ['csvorderid'=>$order['OrderID'], 'email'=>$order['EmailID'], 'csvrowid'=>$j, 'error'=>$errormsg, 'filename'=>$filename];
                $this->customersm->addcustomererror($data, $shopid);
                return $return;
//                $customer = array(
//                    'email' => $order['EmailID'],
//                    'first_name' => $order['FirstName'],
//                    'last_name' => $order['LastName']
//                );
            }
        }
        
        $discount_codes = $shipping_lines = [];
        
        if($order['Coupon'] != '' && $order['Coupon'] != '0'){
            
            $discount_codes[0] = [
                    'code' => $order['Coupon'],
                    'amount' => $order['OrdersDiscount'],
                    'type' => 'fixed_amount',
                ];
        }
        /*Discount code*/
        
        if($order['Carrier'] != '' && $order['Carrier'] != 'NULL'){
            
            $shipping_lines[0] = [
                    'title' => $order['Carrier'],
                    'price' => $order['Freight'],
                ];
        }
        
        $billing_address = array(
                'first_name' => $order['FirstName'],
                'last_name' => $order['LastName'],
                'address1' => $order['Address'],
                'city' => $order['City'],
                'province_code' => $order['State'],
                'country'=>$countryarray[$order['Country']],
                //'phone' => $order['Phone'],
                'zip'=> $order['Zip']
            );

        $shipping_address = array(
                'first_name' => $order['FirstName'],
                'last_name' => $order['LastName'],
                'address1' => $order['Address'],
                'city' => $order['City'],
                'province_code' => $order['State'],
                'country'=>$countryarray[$order['Country']],
                //'phone' => $order['Phone'],
                'zip'=> $order['Zip']
            );

        $syncorder['billing_address'] = $billing_address;
        $syncorder['shipping_address'] = $shipping_address;
        
        $syncorder['note_attributes'] = [
            0=>['name'=>'oldorderno', 'value'=>$order['OrderID']],
            1=>['name'=>'paymenttype', 'value'=>$order['PaymentType']],
            2=>['name'=>'gateway', 'value'=>$order['Gateway']],
            3=>['name'=>'oldsubtotal', 'value'=>$order['SubTotal']],
            4=>['name'=>'orderstatus', 'value'=>$order['Status']],
            5=>['name'=>'orderdate', 'value'=>$processed_at]
        ];
        $syncorder['customer'] = $customer;
        $syncorder['line_items'] = $line_items;
        
        $itemprice = 0;
        foreach ($syncorder['line_items'] as $line_items):
            $itemprice += $line_items['price'];
        endforeach;
        
        if($itemprice == 0){
            $syncorder['line_items'][0]['price'] = $syncorder['subtotal_price']/$syncorder['line_items'][0]['quantity'];
        }
        
        $syncorder['discount_codes'] = $discount_codes;
        $syncorder['shipping_lines'] = $shipping_lines;
        $syncorder['tags'] = $order['OrderID'].', IHF';
        if($order['Website'] != 'iHealth Fulfillment'){
            $syncorder['tags'] .= ', Loyalty Specialist';
        }
        
        $gateway = (isset($order['Gateway']) && $order['Gateway'] != '')?$order['Gateway']:'manual';
        
        if($order['Status'] == 'Shipped'){
            
            $syncorder['transactions'] = [0=>['currency'=>'USD', 'gateway'=>$gateway, 'kind'=>'capture', 'status'=>'success', 'amount'=>$order['Total']]];
        }else{
            $syncorder['financial_status'] = 'pending';
        }
        
        $pushorder['order'] = $syncorder;
        //pre($pushorder);exit;

        try {
            $ordersData = $this->shopifyapi->call('POST', '/admin/orders.json', $pushorder);
            $data = ['csvorderid'=>$order['OrderID'], 'shopifyorderid'=>$ordersData['id'], 'ordername'=>$ordersData['name'], 'filename'=>$filename];
            $this->ordersm->addorder($data, $shopid);
            
            if($order['Status'] != 'Shipped'){
                $this->shopifyapi->call('POST', '/admin/orders/'.$ordersData['id'].'/cancel.json', $pushorder);
            }
            
            $return['status'] = 'success';
            $return['message'] = $order['OrderID'].' Synced';
            return $return;
        } catch (ShopifyApiException $e) {
            $msg = $e->getResponse();
            //pre($msg);exit;
            $errormsg = $order['OrderID'].' : ';
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
            $return['status'] = 'error';
            $return['message'] = $errormsg;
            $data = ['csvorderid'=>$order['OrderID'], 'csvrowid'=>$j, 'errornote'=>$errormsg, 'filename'=>$filename];
            $this->ordersm->addordererror($data, $shopid);
            return $return;
        }
        
    }

}