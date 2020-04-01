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

    public function Edit(){
        $data = [
			'user' => $this->ion_auth->user()->row(),
			'judul'	=> 'Edit Profil',
            'subjudul'=> '',
            'profil'    => $this->profil->editProdiPilihan(),
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

        return redirect()->to('dashboard');
    }
}

?>