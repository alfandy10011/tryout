<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

	public function __construct(){
		parent::__construct();
		if (!$this->ion_auth->logged_in()){
			redirect('auth');
		}
		$this->load->model('Dashboard_model', 'dashboard');
		$this->load->library(['datatables']);// Load Library Ignited-Datatables
		$this->load->model('Master_model', 'master');
		$this->load->model('Ujian_model', 'ujian');
		$this->user = $this->ion_auth->user()->row();
	}

	public function admin_box()
	{
		$box = [
			[
				'box' 		=> 'light-blue',
				'total' 	=> $this->dashboard->total('jurusan'),
				'title'		=> 'Fitur',
				'icon'		=> 'graduation-cap'
			],
			[
				'box' 		=> 'olive',
				'total' 	=> $this->dashboard->total('kelas'),
				'title'		=> 'Ujian Seleksi',
				'icon'		=> 'building-o'
			],
			[
				'box' 		=> 'yellow-active',
				'total' 	=> $this->dashboard->total('dosen'),
				'title'		=> 'Judul Tryout',
				'icon'		=> 'user-secret'
			],
			[
				'box' 		=> 'red',
				'total' 	=> $this->dashboard->total('mahasiswa'),
				'title'		=> 'Member',
				'icon'		=> 'user'
			],
		];
		$info_box = json_decode(json_encode($box), FALSE);
		return $info_box;
	}

	public function index()
	{
		$user = $this->user;
		$data = [
			'user' 		=> $user,
			'judul'		=> 'Dashboard',
			'subjudul'	=> 'Data Aplikasi',
		];

		if ( $this->ion_auth->is_admin() ) {
			$data['info_box'] = $this->admin_box();
		} elseif ( $this->ion_auth->in_group('dosen') ) {
			$matkul = ['matkul' => 'dosen.matkul_id=matkul.id_matkul'];
			$data['dosen'] = $this->dashboard->get_where('dosen', 'nip', $user->username, $matkul)->row();

			$kelas = ['kelas' => 'kelas_dosen.kelas_id=kelas.id_kelas'];
			$data['kelas'] = $this->dashboard->get_where('kelas_dosen', 'dosen_id' , $data['dosen']->id_dosen, $kelas, ['nama_kelas'=>'ASC'])->result();
		}else{
			$mhs 	= $this->ujian->getIdMahasiswa($this->user->username);
			$pilihan = $this->ujian->getPrediksiKelulusan($mhs->id_mahasiswa)->row();
			$pilihan_1 = $pilihan->pilihan_1;
			$pilihan_2 = $pilihan->pilihan_2;
			$pilihan_3 = $pilihan->pilihan_3;

			// Show Nama
			$get_nama1 = $this->ujian->showProdiPilihan($pilihan_1)->nama_prodi;
			$get_nama2 = $this->ujian->showProdiPilihan($pilihan_2)->nama_prodi;
			$get_nama3 = $this->ujian->showProdiPilihan($pilihan_3)->nama_prodi;

			$join = [
				'kelas b' 	=> 'a.kelas_id = b.id_kelas',
				'jurusan c'	=> 'b.jurusan_id = c.id_jurusan'
			];
			$data['mahasiswa'] = $this->dashboard->get_where('mahasiswa a', 'nim', $user->username, $join)->row();
			$data['pilihan_1'] = $get_nama1;
			$data['pilihan_2'] = $get_nama2;
			$data['pilihan_3'] = $get_nama3;
		}

		$this->load->view('_templates/dashboard/_header.php', $data);
		$this->load->view('dashboard');
		$this->load->view('_templates/dashboard/_footer.php');
	}
}