<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Profil_model extends CI_Model {

    public function editProdiPilihan(){
        $this->db->select('*');
        $this->db->from('data_prodi');

        return $this->db->get()->result();

    }

    public function editProfil($id){
        $this->db->select('*');
        $this->db->from('mahasiswa');
        $this->db->where('id_mahasiswa', $id);

        return $this->db->get()->row();
    }

    public function tampilProdi($id){
        $this->db->select('*');
        $this->db->from('data_prodi');
        $this->db->where('id_prodi', $id);
        return $this->db->get()->row();
    }

}
