<?php
class Import_model extends CI_Model
{
 function select()
 {
  $this->db->order_by('id', 'DESC');
  $query = $this->db->get('student_list');
  return $query;
 }
 function insert($data)
 {
  $this->db->insert_batch('student_list', $data);
 }
}