<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Csvreader {

var $fields;/** columns names retrieved after parsing */
var $separator = ';';/** separator used to explode each line */
var $enclosure = '"';/** enclosure used to decorate each field */
var $max_row_size = 4096;/** maximum row size to be used for decoding */

function parse_file($p_Filepath, $delimiter = FALSE ) {

    $file = fopen($p_Filepath, 'r');
    $this->fields = fgetcsv($file, $this->max_row_size, $this->separator, $this->enclosure);
    if ($delimiter==FALSE) {
        $keys = str_getcsv($this->fields[0]);

        $i = 1;
        while (($row = fgetcsv($file, $this->max_row_size, $this->separator, $this->enclosure)) != false) {
            //pre($row);exit;
            if ($row != null) { // skip empty lines
                $values = str_getcsv($row[0]);
                if (count($keys) == count($values)) {
                    $arr = array();
                    for ($j = 0; $j < count($keys); $j++) {
                        if ($keys[$j] != "") {
                            
                            $arr[$keys[$j]] = $values[$j];
                            if($keys[$j] == 'Discount'){
                                //echo $j;var_dump($arr);
                            }
                        }
                    }
                    $content[$i] = $arr;
                    $i++;
                }
            }
        }
    }
    else{
        $keys = str_getcsv($this->fields[0],$delimiter);

        $i = 1;
        while (($row = fgetcsv($file, $this->max_row_size, $this->separator, $this->enclosure)) != false) {
            if ($row != null) { // skip empty lines
                $values = str_getcsv($row[0],$delimiter);
                if (count($keys) == count($values)) {
                    $arr = array();
                    for ($j = 0; $j < count($keys); $j++) {
                        if ($keys[$j] != "") {
                            $arr[$keys[$j]] = $values[$j];
                        }
                    }

                    $content[$i] = $arr;
                    $i++;
                }
            }
        }
    }

    fclose($file);
    return $content;
}}?>