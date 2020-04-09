<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Soal_model extends CI_Model
{

  public function getDataSoal($id, $dosen)
  {
    $this->datatables->select('a.id_soal, a.soal, FROM_UNIXTIME(a.created_on) as created_on, FROM_UNIXTIME(a.updated_on) as updated_on, b.nama_matkul, c.nama_dosen');
    $this->datatables->from('tb_soal a');
    $this->datatables->join('matkul b', 'b.id_matkul=a.matkul_id');
    $this->datatables->join('dosen c', 'c.id_dosen=a.dosen_id');
    if ($id !== null && $dosen === null) {
      $this->datatables->where('a.matkul_id', $id);
    } else if ($id !== null && $dosen !== null) {
      $this->datatables->where('a.dosen_id', $dosen);
    }
    return $this->datatables->generate();
  }

  public function getSoalById($id)
  {
    return $this->db->get_where('tb_soal', ['id_soal' => $id])->row();
  }

  public function getMatkulDosen($nip)
  {
    $this->db->select('matkul_id, nama_matkul, id_dosen, nama_dosen');
    $this->db->join('matkul', 'matkul_id=id_matkul');
    $this->db->from('dosen')->where('nip', $nip);
    return $this->db->get()->row();
  }

  public function getNamaUjian($id_ujian)
  {
    $this->db->select('nama_ujian');
    $this->db->from('m_ujian');
    $this->db->where('id_ujian', $id_ujian);
    return $this->db->get()->row();
  }

  public function getIdUjian($id)
  {
    $this->db->select('ujian_id');
    $this->db->from('h_ujian');
    $this->db->where('id', $id);
    return $this->db->get()->row();
  }

  public function getIdTryoutById($id)
  {
    $this->db->select('id_tryout');
    $this->db->from('h_ujian');
    $this->db->where('id', $id);
    return $this->db->get()->row();
  }

  public function getAllDosen()
  {
    $this->db->select('*');
    $this->db->from('dosen a');
    $this->db->join('matkul b', 'a.matkul_id=b.id_matkul');
    return $this->db->get()->result();
  }

  public function getTryout()
  {
    $this->db->select('id_tryout');
    $this->db->from('m_tryout');
    return $this->db->get()->result_array();
  }

  public function getHasilTryout($id_mahasiswa)
  {
    $this->db->select('*');
    $this->db->from('h_tryout');
    $this->db->where('id_mahasiswa', $id_mahasiswa);

    return $this->db->get()->row();
  }

  public function getTryoutById($id)
  {
    $this->db->select('*');
    $this->db->from('m_ujian');
    $this->db->where('tryout_id', $id);
    return $this->db->get()->row();
  }

  public function getSoalPembahasan($id, $limit, $start)
  {
    $this->db->select('*');
    $this->db->from('tb_soal');
    $this->db->where('matkul_id', $id);
    return $this->db->limit($limit, $start)->get()->result();
  }

  public function jumlahPembahasan($id)
  {
    $this->db->select('*');
    $this->db->from('tb_soal');
    $this->db->where('matkul_id', $id);

    return $this->db->get()->num_rows();
  }
}
