<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Group_model extends CI_Model
{
  public function get_student_id()
  {
    $this->db->select('*');
    $this->db->from('groups');
    $this->db->where('name', 'mahasiswa');
    return $this->db->get()->row()->id;
  }
}
