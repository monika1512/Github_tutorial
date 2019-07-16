<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Homepage extends CI_Controller {

    function __construct(){
        ini_set('display_errors', 1);
        parent::__construct();
        $this->load->model('loginm', 'auth');
        $this->load->model('homem', 'home');
        $this->load->model('charges_model', 'charges');
        //if ($this->session->userdata('token') == FALSE) redirect('login');
    }

    public function index(){
        
        $statusdata = array();
        $shop = $this->session->userdata('shop');
        
        $data['title'] = 'Oracle';
        
        $this->load->view('header', $data);
        $this->load->view('index', $data);
        $this->load->view('footer');
    }
    
    public function export_customerbg() {
        $abspath = FCPATH;
        echo "/usr/bin/php5-cli ".$abspath."index.php homepage export_customer >> ".$abspath."cron.log & echo $!";
        $pid = shell_exec("/usr/bin/php5-cli ".$abspath."index.php homepage export_customer >> ".$abspath."cron.log & echo $!");
        echo $pid;
    }

    public function export_customer() {

        if (!$this->input->is_cli_request()) {
        
            $shop   = 'metizsoft1.myshopify.com';
            $token  = '2bd33441f554065eb124376e4c951d40';

            $limit  = 250;
            $tpages = 2;
            $this->load->model('Customersm', 'customer');
            $getcroncount = $this->customer->getordercronsyncusto();
            
            $start_page  = $getcroncount->tasksyncno;
            $start_page  = !empty($start_page) ? $start_page : '1';

            try {

                $params = array('shop_domain' => $shop, 'token' => $token, 'api_key' => API_KEY, 'secret' => SECRET);
                $this->load->library('shopifyapi', $params);

                $pages = $start_page+$tpages-1;

                $ins = $ins_add = 0;
                for ($i = $start_page; $i <= $pages; $i++) :

                    $customers = $this->shopifyapi->call('GET','/admin/customers.json?limit='.$limit.'&page='.$i);
                    $bulksavecustomers = $bulksaveaddress = [];

                 //print_r($customers);exit;
				/// pre($customers);exit;
                    foreach ($customers as $customer) {
                        unset($customer['admin_graphql_api_id']);
                        unset($customer['default_address']);

                        $customer_addresses = !empty($customer['addresses']) ? $customer['addresses'] : array();
                        unset($customer['addresses']);

                        $total_addresses = count($customer_addresses);

                        $cust_address = (!empty($total_addresses)) ? $customer_addresses[0] : '';

                        $savecustomer = [];
                        $savecustomer['id'] = $customer['id'];
                        $savecustomer['email'] = $customer['email'];
                        $savecustomer['accepts_marketing'] = $customer['accepts_marketing'];
                        $savecustomer['created_at'] = $customer['created_at'];
                        $savecustomer['updated_at'] = $customer['updated_at'];
                        $savecustomer['first_name'] = $customer['first_name'];
                        $savecustomer['last_name'] = $customer['last_name'];
                        $savecustomer['orders_count'] = $customer['orders_count'];
                        $savecustomer['state'] = $customer['state'];
                        $savecustomer['total_spent'] = $customer['total_spent'];
                        $savecustomer['last_order_id'] = $customer['last_order_id'];
                        $savecustomer['note'] = $customer['note'];
                        $savecustomer['verified_email'] = $customer['verified_email'];
                        $savecustomer['multipass_identifier'] = $customer['multipass_identifier'];
                        $savecustomer['tax_exempt'] = $customer['tax_exempt'];
                        $savecustomer['phone'] = $customer['phone'];
                        $savecustomer['tags'] = $customer['tags'];
                        $savecustomer['zipcode'] = $customer['zip'];
                        $savecustomer['last_order_name'] = $customer['last_order_name'];
                        $savecustomer['currency'] = $customer['currency'];
                        $savecustomer['syncpage'] = $i;
                        $savecustomer['address_id']     = isset($cust_address['id'])?$cust_address['id']:'';
                        $savecustomer['company']        = isset($cust_address['company'])?$cust_address['company']:'';
                        $savecustomer['address1']       = isset($cust_address['address1'])?$cust_address['address1']:'';
                        $savecustomer['address2']       = isset($cust_address['address2'])?$cust_address['address2']:'';
                        $savecustomer['city']           = isset($cust_address['city'])?$cust_address['city']:'';
                        $savecustomer['province']       = isset($cust_address['province'])?$cust_address['province']:'';
                        $savecustomer['country']        = isset($cust_address['country'])?$cust_address['country']:'';
                        $savecustomer['zipcode']        = isset($cust_address['zip'])?$cust_address['zip']:'';
                        $savecustomer['name']           = isset($cust_address['name'])?$cust_address['name']:'';
                        $savecustomer['province_code']  = isset($cust_address['province_code'])?$cust_address['province_code']:'';
                        $savecustomer['country_code']   = isset($cust_address['country_code'])?$cust_address['country_code']:'';
                        $savecustomer['country_name']   = isset($cust_address['country_name'])?$cust_address['country_name']:'';
                        $savecustomer['defaultaddress'] = isset($cust_address['default'])?$cust_address['default']:'';
                        
                        $bulksavecustomers[] = $savecustomer;
                        //$inserted = $this->customer->customer_data($savecustomer);

                       // if($inserted) { $ins++; } 

                        if(!empty($total_addresses) && $total_addresses > 1) {

                            unset($customer_addresses[0]);

                            foreach ($customer_addresses as $address) {
                                
                                $bulksaveaddress[] = [
                                    'id'=>$address['id'],
                                    'customer_id'=>$address['customer_id'],
                                    'first_name'=>$address['first_name'],
                                    'last_name'=>$address['last_name'],
                                    'company'=>$address['company'],
                                    'address1'=>$address['address1'],
                                    'address2'=>$address['address2'],
                                    'city'=>$address['city'],
                                    'province'=>$address['province'],
                                    'country'=>$address['country'],
                                    'zipcode'=>$address['zip'],
                                    'phone'=>$address['phone'],
                                    'name'=>$address['name'],
                                    'province_code'=>$address['province_code'],
                                    'country_code'=>$address['country_code'],
                                    'country_name'=>$address['country_name'],
                                    'defaultaddress'=>$address['default'],
                                ];
                                //$inserted_add = $this->customer->customer_addresses($saveaddress);
                                //if($inserted_add) { $ins_add++; } 
                            }
                        }
                        $this->customer->updatecronsynccustomer($i+1);

                    }
                    
                    if(count($bulksavecustomers) > 0){
						
                        $this->db->insert_batch('customer_data', $bulksavecustomers);
                    }
                    if(count($bulksaveaddress) > 0){
                        $this->db->insert_batch('customer_addresses', $bulksaveaddress);
                    }
                endfor;

                //$result['customer_data'] = $ins;
                //$result['customer_addresses'] = $ins_add;
                $result['start_page'] = $start_page + $tpages;
                $result['pages'] = $tpages;

                echo json_encode($result);

            } catch (Exception $ex) { echo '<pre>';
            print_r($ex);
            echo '</pre>';die; }
        }
    }

    public function products(){
		 if (!$this->input->is_cli_request()) {
        
            $shop   = 'metizsoft1.myshopify.com';
            $token  = '2bd33441f554065eb124376e4c951d40';

                $params = array('shop_domain' => $shop, 'token' => $token, 'api_key' => API_KEY, 'secret' => SECRET);
                $this->load->library('shopifyapi', $params);

               
				
                    $products = $this->shopifyapi->call('GET','/admin/products.json');
                    $bulksavecustomers = $bulksaveaddress = [];

                 //print_r($products);exit; ('GET','/admin/products/#{product_id}.json') 1380927373367
				 /*{
  "product": {
    "title": "Burton Custom Freestyle 151",
    "body_html": "<strong>Good snowboard!</strong>",
    "vendor": "Burton",
    "product_type": "Snowboard",
    "tags": "Barnes & Noble, John's Fav, \"Big Air\""
  }
}*/
				 pre($products);exit;
                 
        }
	}

    
	public function postproducts(){
		 if (!$this->input->is_cli_request()) {
        
            $shop   = 'metizsoft1.myshopify.com';
            $token  = '2bd33441f554065eb124376e4c951d40';

                $params = array('shop_domain' => $shop, 'token' => $token, 'api_key' => API_KEY, 'secret' => SECRET);
                $this->load->library('shopifyapi', $params);
                $data=array ('product' => array (
    'title' => 'Burton Custom Freestyle 151',
    'body_html' => 'Good snowboard!',
    'vendor' => 'Burton',
    'product_type' => 'Snowboard',)  
                     );
               
				
                    $products = $this->shopifyapi->call('POST','/admin/products.json',$data);
                    $bulksavecustomers = $bulksaveaddress = [];


				 pre($products);exit;
                 
        }
	}

    public function putproducts(){
		 if (!$this->input->is_cli_request()) {
        
            $shop   = 'metizsoft1.myshopify.com';
            $token  = '2bd33441f554065eb124376e4c951d40';

                $params = array('shop_domain' => $shop, 'token' => $token, 'api_key' => API_KEY, 'secret' => SECRET);
                $this->load->library('shopifyapi', $params);
                $data=array (
							'product' => 
									array ('id' => 1544304066615,'title' => 'New Product Title',
									'variants' => 
									array (0 => array (
													'id' => 13621559033911,
													'price' => '2000.00',
													'sku' => 'Updating the Product SKU',
													),
											),
							        ),
							);
     			
                    $products = $this->shopifyapi->call('PUT','/admin/products/1544304066615.json',$data);
                    $bulksavecustomers = $bulksaveaddress = [];


				 pre($products);exit;
                 
        }
	}
	
	 public function deleteproducts(){
		 if (!$this->input->is_cli_request()) {
        
            $shop   = 'metizsoft1.myshopify.com';
            $token  = '2bd33441f554065eb124376e4c951d40';

                $params = array('shop_domain' => $shop, 'token' => $token, 'api_key' => API_KEY, 'secret' => SECRET);
                $this->load->library('shopifyapi', $params);
               
     			
                    $products = $this->shopifyapi->call('DELETE','/admin/products/1544304066615.json');
                   


				 echo "Product deleted";exit;
                 
        }
	}
	
	
	
	
	
    public function export_data() {
        $this->load->view('header');
        $this->load->view('export_customer');
        $this->load->view('footer');
    }
    
    public function allproc() {
        if ($this->input->is_cli_request()) {
            $res = shell_exec('ps -x');
            $res = explode("\n",$res);
            pre($res);
        }else{
            echo 'else';
            $res = shell_exec('ps -x');
            $res = explode("\n",$res);
            pre($res);
        }
    }
    
    public function export_orderbg() {
        $abspath = FCPATH;
        echo "php ".$abspath."index.php homepage export_order 1 >> ".$abspath."cron.log & echo $!<br>";
        //$pid = shell_exec("php ".$abspath."index.php homepage export_order 1 >> ".$abspath."cron.log & echo $!");
        $pid = shell_exec("php ".$abspath."index.php homepage export_order 1 >> ".$abspath."cron.log & echo $!");
        echo $pid;
    }
    
    public function killproc($pid) {
        shell_exec("kill -kill $pid");
    }
    
    public function export_order() {
        
        //echo phpinfo();exit;
        
        if ($this->input->is_cli_request()) {
            $abspath = FCPATH;
            //echo "php ".$abspath."index.php homepage export_order 'test' >> ".$abspath."cron.log & echo $!<br>";
            //$pid = shell_exec("php ".$abspath."index.php homepage export_order 1 >> ".$abspath."cron.log & echo $!");
            $pid = shell_exec("/usr/bin/php5-cli ".$abspath."index.php homepage export_order >> ".$abspath."cron.log & echo $!");
            //$pid = shell_exec('php '.$abspath.'index.php homepage export_order  >/dev/null 2>&1');
            //$pid = shell_exec('/usr/local/cpanel/3rdparty/bin/php '.$abspath.'process3.php homepage export_order >/dev/null 2>&1 &');

            echo $pid;
        }else{
            
            log_message('error', 'is_cli_request');
            //$shop   = $this->session->userdata('shop');
            //$token  = $this->session->userdata('token');
            $this->load->model('Customersm', 'customer');
            $shop   = 'ihealthstore.myshopify.com';
            $token  = '2b8ea21b22d2b9d34f6f04f7ca3c0e69';
            //$limit  = $this->input->get('limit');
            //$limit  = !empty($limit) ? $limit : '250';
            $limit  = 250;
            //$tpages = 620;
            $tpages = 620;
            $getcroncount = $this->customer->getordercronsync();
            $start_page  = $getcroncount->tasksyncno;
            $start_page  = !empty($start_page) ? $start_page : '1';

            $this->load->model('Customersm', 'customer');

            try {

                $params = array('shop_domain' => $shop, 'token' => $token, 'api_key' => API_KEY, 'secret' => SECRET);
                $this->load->library('shopifyapi', $params);

                $pages = $start_page+$tpages-1;
                $ins = 0;
                for ($i = $start_page; $i <= $pages; $i++) :
                    
                    //echo '/admin/orders.json?status=any&limit='.$limit.'&page='.$i;
                    $orders = $this->shopifyapi->call('GET','/admin/orders/930128986171.json', []);
//pre($orders);exit;
                    log_message('error', 'page no : '.$i);
                    $bulkordersave = [];
                    foreach ($orders as $key=>$order) {


                        //echo $i.' - '.$key.' - '.$order['id'].'<br>';
                        if(!isset($order['shipping_address'])){
                            $order['shipping_address'] = [
                                'first_name'=>'',
                                'address1'=>'',
                                'phone'=>'',
                                'city'=>'',
                                'zip'=>'',
                                'province'=>'',
                                'country'=>'',
                                'last_name'=>'',
                                'address2'=>'',
                                'company'=>'',
                                'name'=>''
                            ];
                        }
                        foreach ($order['line_items'] as $item):

                            $bulkordersave[] = $ordersave = [
                                'email'=>$order['email'],
                                'ship_country'=>$order['shipping_address']['country'],
                                'financial_status'=>$order['financial_status'],
                                'line_item_name'=>$item['title'],
                                'created_at'=>$order['processed_at'],
                                'total_price'=>$order['total_price'],
                                'name'=>$order['name'],
                                'ord_financial_status'=>$order['financial_status'],
                                'paid_at'=>$order['processed_at'],
                                'fulfillment_status'=>$order['fulfillment_status'],
                                'fulfill_created_at'=>isset($order['fulfillments'][0])?$order['fulfillments'][0]['created_at']:'',
                                'buyer_accepts_marketing'=>$order['buyer_accepts_marketing'],
                                'currency'=>$order['currency'],
                                'subtotal'=>$order['subtotal_price'],
                                'shipping_title'=>isset($order['shipping_lines'][0])?$order['shipping_lines'][0]['title']:'',
                                'total_tax'=>$order['total_tax'],
                                'discount_code'=>isset($order['discount_codes'][0])?$order['discount_codes'][0]['code']:'',
                                'shipping_method'=>isset($order['shipping_lines'][0])?$order['shipping_lines'][0]['title']:'',
                                'ord_lineitem_name'=>$item['title'],
                                'line_item_qty'=>$item['quantity'],
                                'line_item_price'=>$item['price'],
                                'line_item_compare_price'=>$item['price'],
                                'line_item_sku'=>$item['sku'],
                                'line_item_requires_shipping'=>$item['requires_shipping'],
                                'line_item_taxable'=>$item['taxable'],
                                'line_item_fulfillment_status'=>$item['fulfillment_status'],
                                'bill_name'=>$order['billing_address']['name'],
                                'bill_street'=>'',
                                'bill_add_one'=>$order['billing_address']['address1'],
                                'bill_add_two'=>$order['billing_address']['address2'],
                                'bill_company'=>$order['billing_address']['company'],
                                'bill_city'=>$order['billing_address']['city'],
                                'bill_zip'=>$order['billing_address']['zip'],
                                'bill_province'=>$order['billing_address']['province'],
                                'bill_country'=>$order['billing_address']['country'],
                                'bill_phone'=>$order['billing_address']['phone'],
                                'ship_name'=>$order['shipping_address']['name'],
                                'ship_steet'=>'',
                                'ship_add_one'=>$order['shipping_address']['address1'],
                                'ship_add_two'=>$order['shipping_address']['address2'],
                                'ship_city'=>$order['shipping_address']['city'],
                                'ship_zip'=>$order['shipping_address']['zip'],
                                'ship_province'=>$order['shipping_address']['province'],
                                'ship_phone'=>$order['shipping_address']['phone'],
                                'notes'=>$order['note'],
                                'note_attributes'=> json_encode($order['note_attributes']),
                                'cancelled_at'=>$order['cancelled_at'],
                                'payment_method'=>isset($order['payment_gateway_names'][0])?$order['payment_gateway_names'][0]:'',
                                'payment_reference'=>'',
                                'refunded_amount'=>isset($order['refunds'][0])?$order['refunds'][0]['transactions'][0]['amount']:'',
                                'line_item_vendor'=>$item['vendor'],
                                'orderid'=>$order['id'],
                                'tags'=>$order['tags'],
                                'risk_level'=>'',
                                'source'=>$order['source_name'],
                                'line_item_discount'=>isset($order['discount_allocations'][0])?$order['discount_allocations'][0]['amount']:'',
                                'phone'=>$order['phone'],
                                'customerid'=>$order['customer']['id'],
                                'orderitemid'=>$item['id'],
                                'syncpage'=>$i
                            ];
                            //$this->customer->order_data($ordersave);
                        endforeach;
                        $ins++;
                        //$syncedpage = $start_page + $ins;
                        $this->customer->updatecronsync($i+1);
                        
                    }
                    if(count($bulkordersave) > 0){
                        $this->db->insert_batch('getorder_data', $bulkordersave);
                    }
//pre($bulkordersave);exit;
                endfor;

                $result['customer_data'] = $ins;
                echo json_encode($result);

            } catch (Exception $ex) { echo '<pre>';
                print_r($ex);
                echo '</pre>';die;
            }
            
        }
    }

    public function exportorder_data() {
        $this->load->view('header');
        $this->load->view('export_orders');
        $this->load->view('footer');
    }
}