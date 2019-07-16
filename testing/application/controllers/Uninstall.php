<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Uninstall extends CI_Controller {

    function __construct() {
        parent::__construct();
    }

    public function index() {
        if (!isset($_SERVER['HTTP_X_SHOPIFY_HMAC_SHA256'])) {
            echo 'Unauthorized';
            exit;
        }
        $this->load->model('charges_model', 'charges');
        $shop = $_GET['shop'];
        $result = $this->charges->uninstall($shop);
    }
}
