<?php
defined('BASEPATH') or exit('No direct script access allowed');

class StudyProgram_model extends CI_Model
{
  public function studyPrograms() {
    $this->db->select('*');
    $this->db->from('data_prodi');
    return $this->db->get()->result();
  }
}
