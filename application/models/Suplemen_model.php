<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Suplemen_model extends CI_Model {
    
    public function tampilEbook(){
        return $this->db->get('ebook');
    }

    public function hapusEbook($where, $table){
        $this->db->where($where);
        $this->db->delete($table);
    }

    function edit_data($where,$table){		
		return $this->db->get_where($table,$where);
	}

    function update_data($where,$data,$table){
		$this->db->where($where);
		$this->db->update($table,$data);
	}

}
