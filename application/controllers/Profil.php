<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Profil extends CI_Controller{
    public function __construct(){
        parent::__construct();
        if (!$this->ion_auth->logged_in()){
			redirect('auth');
        }

        $this->load->library(['datatables', 'form_validation']);// Load Library Ignited-Datatables
        $this->load->helper('my');
        $this->load->model('Master_model', 'master');
        $this->load->model('Ujian_model', 'ujian');
        $this->load->model('Profil_model', 'profil');
        $this->user = $this->ion_auth->user()->row();
        $this->mhs 	= $this->ujian->getIdMahasiswa($this->user->username);
        $this->form_validation->set_error_delimiters('','');

    }

    public function index(){

        $mhs		    = $this->mhs;
        $id_mhs = $mhs->id_mahasiswa;
        $pilihan = $this->ujian->getPrediksiKelulusan($mhs->id_mahasiswa)->row();
            
        $pilihan_1 = $pilihan->pilihan_1;
		$pilihan_2 = $pilihan->pilihan_2;
		$pilihan_3 = $pilihan->pilihan_3;

			// Show Nama
		$get_nama1 = $this->ujian->showProdiPilihan($pilihan_1)->nama_prodi;
		$get_nama2 = $this->ujian->showProdiPilihan($pilihan_2)->nama_prodi;
		$get_nama3 = $this->ujian->showProdiPilihan($pilihan_3)->nama_prodi;

        $data = [
			'user' => $this->ion_auth->user()->row(),
			'judul'	=> 'Profil',
            'subjudul'=> '',
            'profil'    => $this->profil->editProfil($id_mhs),
            'pilihan_1' => $get_nama1,
			'pilihan_2' => $get_nama2,
			'pilihan_3' => $get_nama3,
        ];

        $this->load->view('_templates/dashboard/_header.php', $data);
		$this->load->view('profil/index', $data);
		$this->load->view('_templates/dashboard/_footer.php');
    }

    public function Edit(){

        $mhs		    = $this->mhs;
        $id_mhs = $mhs->id_mahasiswa;

        $data = [
			'user' => $this->ion_auth->user()->row(),
			'judul'	=> 'Edit Profil',
            'subjudul'=> '',
            'profil'    => $this->profil->editProdiPilihan(),
            'identitas' => $this->profil->editProfil($id_mhs),
            'tampil_prodi'  => $this->profil->tampilProdi($id_mhs),
        ];
        
        $this->load->view('_templates/dashboard/_header.php', $data);
		$this->load->view('profil/edit', $data);
		$this->load->view('_templates/dashboard/_footer.php');
    }

    public function editProfil(){
        $this->load->helper('string');
    
        $nama_lengkap	= $this->input->post('nama_lengkap', true);
        $asal_sekolah	= $this->input->post('asal_sekolah', true);
        $pilihan_1	    = $this->input->post('pil_1', true);
        $pilihan_2	    = $this->input->post('pil_2', true);
        $pilihan_3	    = $this->input->post('pil_3', true);
        $mhs		    = $this->mhs;
        $id_mhs         = $mhs->id_mahasiswa;
        

        $input = [
            'nama'          => $nama_lengkap,
            'sekolah'       => $asal_sekolah,
            'pilihan_1'     => $pilihan_1,
            'pilihan_2'     => $pilihan_2,
            'pilihan_3'     => $pilihan_3,
        ];

        $this->master->update('mahasiswa', $input, 'id_mahasiswa', $id_mhs);
        $this->session->set_flashdata('flash', 'Diubah');
        redirect('dashboard');
    }
}

?>