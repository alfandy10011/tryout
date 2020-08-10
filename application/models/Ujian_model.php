<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Ujian_model extends CI_Model
{

  public function getDataUjian($id)
  {
    $this->datatables->select('a.id_ujian, a.token, a.nama_ujian, b.nama_mataujian, a.jumlah_soal, CONCAT(a.tgl_mulai, " <br/> (", a.waktu, " Menit)") as waktu, a.jenis');
    $this->datatables->from('m_ujian a');
    $this->datatables->join('mataujian b', 'a.mataujian_id = b.id_mataujian');
    if ($id !== null) {
      $this->datatables->where('dosen_id', $id);
    }
    return $this->datatables->generate();
  }

  public function getListUjian($id_member, $kelas, $id_tryout)
  {
    $this->db->select("
          m_ujian.mataujian_id,
          m_ujian.id_ujian,
          m_ujian.nama_ujian,
          m_ujian.tryout_id,
          m_ujian.jumlah_soal,
          m_ujian.waktu,
          mataujian.nama_mataujian,
          dosen.nama_dosen,
          kelas.nama_kelas,
          h_ujian.id as id_hasil_ujian,
          h_ujian.selesai,
          ");

    $this->db->from('m_ujian');
    $this->db->join('mataujian', 'm_ujian.mataujian_id = mataujian.id_mataujian');
    $this->db->join('kelas_dosen', "m_ujian.dosen_id = kelas_dosen.dosen_id");
    $this->db->join('kelas', 'kelas_dosen.kelas_id = kelas.id_kelas');
    $this->db->join('dosen', 'dosen.id_dosen = kelas_dosen.dosen_id');
    $this->db->join('h_ujian', "m_ujian.id_ujian = h_ujian.ujian_id AND h_ujian.member_id = {$id_member}", 'left');
    $this->db->where('kelas.id_kelas', $kelas);
    $this->db->where('m_ujian.tryout_id', $id_tryout);
    return $this->db->get()->result();
  }


  public function HslUjianById($id, $dt = false)
  {
    if ($dt === false) {
      $db = "db";
      $get = "get";
    } else {
      $db = "datatables";
      $get = "generate";
    }

    $this->$db->select('d.id, a.nama, b.nama_kelas, c.nama_seleksi, d.jml_benar, d.jml_salah, d.nilai');
    $this->$db->from('member a');
    $this->$db->join('kelas b', 'a.kelas_id=b.id_kelas');
    $this->$db->join('seleksi c', 'b.seleksi_id=c.id_seleksi');
    $this->$db->join('h_ujian d', 'a.id_member=d.member_id');
    $this->$db->where(['d.id_tryout' => $id]);
    return $this->$db->$get();
  }

  public function HslRankingNasional($id, $dt = false)
  {
    if ($dt === false) {
      $db = "db";
      $get = "get";
    } else {
      $db = "datatables";
      $get = "generate";
    }

    $this->$db->select('*, (nilai_tpa + nilai_tbi) as total_tpa_tbi, (nilai_twk + nilai_tiu + nilai_tkp) as total_skd');
    $this->$db->from('h_tryout');
    $this->$db->where('id_tryout', $id);
    return $this->$db->$get();
  }

  public function getUjianById($id)
  {
    $this->db->select('*');
    $this->db->from('m_ujian a');
    $this->db->join('dosen b', 'a.dosen_id=b.id_dosen');
    $this->db->join('mataujian c', 'a.mataujian_id=c.id_mataujian');
    $this->db->where('id_ujian', $id);
    return $this->db->get()->row();
  }

  public function getIdDosen($nip)
  {
    $this->db->select('id_dosen, nama_dosen')->from('dosen')->where('nip', $nip);
    return $this->db->get()->row();
  }

  public function getJumlahSoal($dosen)
  {
    $this->db->select('COUNT(id_soal) as jml_soal');
    $this->db->from('tb_soal');
    $this->db->where('dosen_id', $dosen);
    return $this->db->get()->row();
  }

  public function getIdMahasiswa($username)
  {
    $this->db->select('*');
    $this->db->from('member a');
    $this->db->join('kelas b', 'a.kelas_id=b.id_kelas');
    $this->db->join('seleksi c', 'b.seleksi_id=c.id_seleksi');
    $this->db->where('username', $username);
    return $this->db->get()->row();
  }

  public function HslUjian($id, $mhs)
  {
    $this->db->select('*, UNIX_TIMESTAMP(tgl_selesai) as waktu_habis');
    $this->db->from('h_ujian');
    $this->db->where('ujian_id', $id);
    $this->db->where('member_id', $mhs);
    return $this->db->get();
  }

  public function getSoal($id)
  {
    $ujian = $this->getUjianById($id);
    $order = $ujian->jenis === "acak" ? 'rand()' : 'id_soal';

    $this->db->select('id_soal, soal, file, tipe_file, opsi_a, opsi_b, opsi_c, opsi_d, opsi_e, jawaban');
    $this->db->from('tb_soal');
    $this->db->where('dosen_id', $ujian->dosen_id);
    $this->db->where('mataujian_id', $ujian->mataujian_id);
    $this->db->order_by($order);
    $this->db->limit($ujian->jumlah_soal);
    return $this->db->get()->result();
  }

  public function ambilSoal($pc_urut_soal1, $pc_urut_soal_arr)
  {
    $this->db->select("*, {$pc_urut_soal1} AS jawaban");
    $this->db->from('tb_soal');
    $this->db->where('id_soal', $pc_urut_soal_arr);
    return $this->db->get()->row();
  }

  public function getJawaban($id_tes)
  {
    $this->db->select('list_jawaban');
    $this->db->from('h_ujian');
    $this->db->where('id', $id_tes);
    return $this->db->get()->row()->list_jawaban;
  }

  public function getHasilUjian($nip = null)
  {
    $this->datatables->select('b.id_ujian, b.nama_ujian, b.jumlah_soal, CONCAT(b.waktu, " Menit") as waktu, b.tgl_mulai');
    $this->datatables->select('c.nama_mataujian, d.nama_dosen');
    $this->datatables->from('h_ujian a');
    $this->datatables->join('m_ujian b', 'a.ujian_id = b.id_ujian');
    $this->datatables->join('mataujian c', 'b.mataujian_id = c.id_mataujian');
    $this->datatables->join('dosen d', 'b.dosen_id = d.id_dosen');
    $this->datatables->group_by('b.id_ujian');
    if ($nip !== null) {
      $this->datatables->where('d.nip', $nip);
    }
    return $this->datatables->generate();
  }

  public function HslUjianByIdTryout($id, $dt = false)
  {
    if ($dt === false) {
      $db = "db";
      $get = "get";
    } else {
      $db = "datatables";
      $get = "generate";
    }
    $this->$db->select('d.id, a.nama, b.nama_kelas, c.nama_seleksi, d.jml_benar, d.nilai');
    $this->$db->from('member a');
    $this->$db->join('kelas b', 'a.kelas_id=b.id_kelas');
    $this->$db->join('seleksi c', 'b.seleksi_id=c.id_seleksi');
    $this->$db->join('h_ujian d', 'a.id_member=d.member_id');
    $this->$db->where(['d.id_tryout' => $id]);
    return $this->db->$get();
  }

  public function bandingNilai($id)
  {
    $this->db->select_min('nilai', 'min_nilai');
    $this->db->select_max('nilai', 'max_nilai');
    $this->db->select_avg('FORMAT(FLOOR(nilai),0)', 'avg_nilai');
    $this->db->where('ujian_id', $id);
    return $this->db->get('h_ujian')->row();
  }

  public function getListRanking()
  {
    $this->db->select('id_tryout');
    $this->db->from('m_tryout');
    return $this->db->get()->result_array();
  }

  public function getEvaluasiHasil($tryout_id, $id_member)
  {
    $this->db->select('*');
    $this->db->from('h_tryout');
    $this->db->where('id_tryout', $tryout_id);
    $this->db->where('id_member', $id_member);
    return $this->db->get();
  }

  public function getPrediksiKelulusan($id)
  {
    $this->db->select('*');
    $this->db->from('member');
    $this->db->where('id_member', $id);
    return $this->db->get();
  }

  public function getPassingGrade($id)
  {
    $this->db->select('*');
    $this->db->from('data_prodi');
    $this->db->where('id_prodi', $id);
    return $this->db->get();
  }

  public function showProdiPilihan($id)
  {
    $this->db->select('nama_prodi');
    $this->db->from('data_prodi');
    $this->db->where('id_prodi', $id);
    return $this->db->get()->row();
  }
}
