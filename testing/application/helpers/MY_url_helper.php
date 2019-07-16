<?php

function theme_url($uri) {
    $CI = & get_instance();
    return $CI->config->base_url('application/views/' . $uri);
}

//to generate an image tag, set tag to true. you can also put a string in tag to generate the alt tag
function theme_img($uri, $tag = false) {
    if ($tag) {
        return '<img src="' . theme_url('assets/img/' . $uri) . '" alt="' . $tag . '">';
    } else {
        return theme_url('assets/img/' . $uri);
    }
}

function theme_js($uri, $tag = false) {
    if ($tag) {
        return '<script type="text/javascript" src="' . theme_url('assets/js/' . $uri) . '"></script>';
    } else {
        return theme_url('assets/js/' . $uri);
    }
}

//you can fill the tag field in to spit out a link tag, setting tag to a string will fill in the media attribute
function theme_css($uri, $tag = false) {
    if ($tag) {
        $media = false;
        if (is_string($tag)) {
            $media = 'media="' . $tag . '"';
        }
        return '<link href="' . theme_url('assets/css/' . $uri) . '" type="text/css" rel="stylesheet" ' . $media . '/>';
    }

    return theme_url('assets/css/' . $uri);
}

function pre($data) {
    echo '<pre>';
    print_r($data);
    echo '</pre>';
}

function getstore($field = '') {
    $CI = & get_instance();

    if ($field != '') {
        $storedata = $CI->session->userdata('store');
        return isset($storedata->$field) ? $storedata->$field : 0;
    }
    return $CI->session->userdata('store');
}

function errorpage($data) {
    $CI = & get_instance();
    $CI->view('error_404', $data);
}

function getcountries() {
    $CI = & get_instance();
    $CI->load->library('csvreader');
    $file = getcwd().'/dump/countries.csv';
    $countryarray = $CI->csvreader->parse_file($file);
    $countrylist = [];
    foreach ($countryarray as $country):
        $countrylist[$country['Name']] = $country['Code'];
    endforeach;
    return $countrylist;
}
function getphonecode() {
    $CI = & get_instance();
    $CI->load->library('csvreader');
    $file = getcwd().'/dump/countries.csv';
    $countryarray = $CI->csvreader->parse_file($file);
    $countrylist = [];
    foreach ($countryarray as $country):
        $countrylist[$country['Name']] = $country['phonecode'];
    endforeach;
    return $countrylist;
}