<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Orderstemp extends CI_Controller {

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
        $filename = '2015/Supplement 2015 Q2.csv';
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
        $frequency = 3000;
        $lastsync = $currentsyncno;
        $finishsyncno = $currentsyncno+$frequency;
        
        $resultdata = [];
        $status = 'finish';
        $this->load->library('csvreader');
        $filename = '2015/Supplement 2015 Q2.csv';
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

            // if($order['OrderID'] != '189639'){
            //     continue;
            // }
            
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
        
        $getstore = $this->auth->getstore($shopid);
        $getdborder = $this->ordersm->checktemporder($order['OrderID']);
        if(isset($getdborder->csvorderid)){
            $return['status'] = 'error';
            $return['message'] = $order['OrderID'].' already sync with shopify order id : '.$getdborder->ordername;
            return $return;
        }       
        
        $countryarray = getcountries();
        $phonecodearray = getphonecode();
        if(!isset($countryarray[$order['Country']])){
            $return['status'] = 'error';
            $return['message'] = $order['Country'].' country not available in shopify';
            $data = ['csvorderid'=>$order['OrderID'], 'csvrowid'=>$j, 'errornote'=>$return['message'], 'filename'=>$filename];
        }        
        if($shopid){
            $shop = $getstore->shop_url;
            $token = $getstore->token;
        }else{
            $shop = $this->session->userdata('shop');
            $token = $this->session->userdata('token');
        }        
        $processed_at = date("Y-m-d", strtotime($order['OrderDate'])).'T'.$order['OrderTime'].'-05:00';        
        $syncorder = [];
        $syncorder['email'] = $order['EmailID'];
        $syncorder['processed_at'] = $processed_at;
        $syncorder['transaction_processed_at'] = $processed_at;
        $syncorder['transaction_gateway'] = $order['Gateway'];
        //$syncorder['total_weight'] = $order['Freight'];
        $syncorder['total_tax'] = $order['Tax'];
        $syncorder['taxes_included'] = "false";
        
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
        $discount_codes = $shipping_lines = [];        
        if($order['Coupon'] != '' && $order['Coupon'] != '0'){
            $syncorder['discount_code'] = $order['Coupon'];
            $syncorder['discount_amount'] = $order['OrdersDiscount'];
            $syncorder['discount_type'] = 'fixed_amount';
        }
        /*Discount code*/        
        if($order['Carrier'] != '' && $order['Carrier'] != 'NULL'){
            $syncorder['shipping_line_title'] = $order['Carrier'];
            $syncorder['shipping_line_price'] = $order['Freight'];
        }
        $phonecode = '';
        if(isset($phonecodearray[$order['Country']])){
            $phonecode = '+'.$phonecodearray[$order['Country']];
        }
        $fullname =  $order['FirstName'].' '.$order['LastName'];
        $syncorder['shipping_name'] = $fullname;
        $syncorder['billing_name'] = $fullname;
        $syncorder['billing_first_name'] = $order['FirstName'];
        $syncorder['billing_last_name'] = $order['LastName'];
        $syncorder['billing_address1'] = $order['Address'];
        $syncorder['billing_city'] = $order['City'];
        $syncorder['billing_province_code'] = $order['State'];
        $syncorder['billing_country'] = $order['Country'];
        $syncorder['billing_zip'] = $order['Zip'];
        $syncorder['billing_phone'] = $phonecode.$order['Phone'];
        $syncorder['shipping_first_name'] = $order['FirstName'];
        $syncorder['shipping_last_name'] = $order['LastName'];
        $syncorder['shipping_address1'] = $order['Address'];
        $syncorder['shipping_city'] = $order['City'];
        $syncorder['shipping_province_code'] = $order['State'];
        $syncorder['shipping_country'] = $order['Country'];
        $syncorder['shipping_zip'] = $order['Zip'];  
        $syncorder['shipping_phone'] = $phonecode.$order['Phone'];
        $syncorder2['line_items'] = $line_items;       

        $itemprice = 0;
        foreach ($syncorder2['line_items'] as $line_items):
            $itemprice += $line_items['price'];
        endforeach;
            
        if($itemprice == 0){
            $syncorder2['line_items'][0]['price'] =  $order['SubTotal']/$syncorder2['line_items'][0]['quantity'];
        }        
        $syncorder['tags'] = 'oldorderno#'.$order['OrderID'].', IHF, paymenttype#'.$order['PaymentType'].',gateway#'.$order['Gateway'].', oldsubtotal#'.$order['SubTotal'].', orderstatus#'.$order['Status'].', orderdate'.$processed_at;
        
        $gateway = (isset($order['Gateway']) && $order['Gateway'] != '')?$order['Gateway']:'manual';
        
        if($order['Status'] == 'Shipped'){
            $syncorder['transaction_gateway'] = $gateway;
            $syncorder['transaction_kind'] = 'capture';
            $syncorder['transaction_status'] = 'success';
            $syncorder['transaction_amount'] = $order['Total'];
        }else{
            $syncorder['financial_status'] = 'pending';
            $syncorder['cancelled_at'] = $processed_at;
        }
        $syncorder['name'] = $order['OrderID']; 
        foreach ($syncorder2['line_items'] as $line => $inserttemp) {
            $item = [];
            $item['lineitem_name'] = $syncorder['lineitem_name'] = $inserttemp['title'];    
            $item['name'] = $syncorder['name'];
            $item['lineitem_quantity'] = $syncorder['lineitem_quantity'] = $inserttemp['quantity'];
            $item['lineitem_price'] = $syncorder['lineitem_price'] = $inserttemp['price'];
            $item['lineitem_sku'] = $syncorder['lineitem_sku'] = $inserttemp['sku'];
            if($line == 0){
                $this->ordersm->addtemporder($syncorder);
            }else{
                $this->ordersm->addtemporder($item);
            }            
        }   
    }
}