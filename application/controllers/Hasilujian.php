<?php
defined('BASEPATH') or exit('No direct script access allowed');

class HasilUjian extends CI_Controller
{

  public function __construct()
  {
    parent::__construct();
    if (!$this->ion_auth->logged_in()) {
      redirect('auth');
    }

    $this->load->library(['datatables']); // Load Library Ignited-Datatables
    $this->load->model('Master_model', 'master');
    $this->load->model('Ujian_model', 'ujian');

    $this->user = $this->ion_auth->user()->row();
  }

  public function output_json($data, $encode = true)
  {
    if ($encode) $data = json_encode($data);
    $this->output->set_content_type('application/json')->set_output($data);
  }

  public function data()
  {
    $nip_dosen = null;

    if ($this->ion_auth->in_group('dosen')) {
      $nip_dosen = $this->user->username;
    }

    $this->output_json($this->ujian->getHasilUjian($nip_dosen), false);
  }

  public function NilaiMhs($id)
  {
    $this->output_json($this->ujian->HslUjianById($id, true), false);
  }

  public function RankingTo($id)
  {
    $this->output_json($this->ujian->HslRankingNasional($id, true), false);
  }

  public function index()
  {
    $data = [
      'user' => $this->user,
      'judul'  => 'Ranking',
      'subjudul' => 'Ranking Nasional',
    ];
    $this->load->view('_templates/dashboard/_header.php', $data);
    $this->load->view('ujian/hasil');
    $this->load->view('_templates/dashboard/_footer.php');
  }

  public function detail($id)
  {
    $ujian = $this->ujian->getUjianById($id);
    $nilai = $this->ujian->bandingNilai($id);

    $data = [
      'user' => $this->user,
      'judul'  => 'Ujian',
      'subjudul' => 'Detail Hasil Ujian',
      'ujian'  => $ujian,
      'nilai'  => $nilai,
    ];

    $this->load->view('_templates/dashboard/_header.php', $data);
    $this->load->view('ujian/detail_hasil');
    $this->load->view('_templates/dashboard/_footer.php');
  }

  public function daftar_ranking()
  {
    $data = [
      'user' => $this->ion_auth->user()->row(),
      'judul'  => 'Daftar Tryout',
      'subjudul' => '',
      'tryout'  => $this->ujian->getListRanking(),
    ];

    $this->load->view('_templates/dashboard/_header.php', $data);
    $this->load->view('ujian/daftar_ranking', $data);
    $this->load->view('_templates/dashboard/_footer.php');
  }

  public function ranking($id)
  {
    $ujian = $this->ujian->getUjianById($id);

    $data = [
      'user' => $this->ion_auth->user()->row(),
      'judul'  => 'Ranking',
      'subjudul' => '',
      'ujian'  => $ujian,
    ];

    $this->load->view('_templates/dashboard/_header.php', $data);
    $this->load->view('ujian/ranking');
    $this->load->view('_templates/dashboard/_footer.php');
  }

  public function evaluasi_hasil($id)
  {

    $mhs   = $this->ujian->getIdMahasiswa($this->user->username);
    $hasil   = $this->ujian->getEvaluasiHasil($id, $mhs->id_mahasiswa)->row();
    $pilihan = $this->ujian->getPrediksiKelulusan($mhs->id_mahasiswa)->row();
    $pilihan_1 = $pilihan->pilihan_1;
    $pilihan_2 = $pilihan->pilihan_2;
    $pilihan_3 = $pilihan->pilihan_3;

    // Passing Grade
    $pg_1 = $this->ujian->getPassingGrade($pilihan_1)->row();
    $pg_2 = $this->ujian->getPassingGrade($pilihan_2)->row();
    $pg_3 = $this->ujian->getPassingGrade($pilihan_3)->row();
    $cek_pg_1 = $pg_1->passing_grade;
    $cek_pg_2 = $pg_2->passing_grade;
    $cek_pg_3 = $pg_3->passing_grade;

    // Show Nama
    $get_nama1 = $this->ujian->showProdiPilihan($pilihan_1)->nama_prodi;
    $get_nama2 = $this->ujian->showProdiPilihan($pilihan_2)->nama_prodi;
    $get_nama3 = $this->ujian->showProdiPilihan($pilihan_3)->nama_prodi;

    $data = [
      'user'  => $this->ion_auth->user()->row(),
      'judul'  => 'Evaluasi Hasil',
      'subjudul'  => '',
      'hasil' => $hasil,
      'mhs'  => $mhs,
      'pilihan_1'  => $pilihan_1,
      'pilihan_2'  => $pilihan_2,
      'pilihan_3'  => $pilihan_3,
      'cek_pg_1'  => $cek_pg_1,
      'cek_pg_2'  => $cek_pg_2,
      'cek_pg_3'  => $cek_pg_3,
      'get_nama1'  => $get_nama1,
      'get_nama2'  => $get_nama2,
      'get_nama3'  => $get_nama3,
    ];

    $this->load->view('_templates/dashboard/_header.php', $data);
    $this->load->view('ujian/evaluasi_hasil', $data);
    $this->load->view('_templates/dashboard/_footer.php');
  }


  public function cetak($id)
  {
    $this->load->library('Pdf');

    $mhs   = $this->ujian->getIdMahasiswa($this->user->username);
    $hasil   = $this->ujian->HslUjian($id, $mhs->id_mahasiswa)->row();
    $ujian   = $this->ujian->getUjianById($id);

    $data = [
      'ujian' => $ujian,
      'hasil' => $hasil,
      'mhs'  => $mhs
    ];

    $this->load->view('ujian/cetak', $data);
  }

  public function cetak_detail($id)
  {
    $this->load->library('Pdf');

    $ujian = $this->ujian->getUjianById($id);
    $nilai = $this->ujian->bandingNilai($id);
    $hasil = $this->ujian->HslUjianById($id)->result();

    $data = [
      'ujian'  => $ujian,
      'nilai'  => $nilai,
      'hasil'  => $hasil
    ];

    $this->load->view('ujian/cetak_detail', $data);
  }
}
