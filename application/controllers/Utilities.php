<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Utilities extends CI_Controller{
    public function __construct(){
        parent::__construct();
        if (!$this->ion_auth->logged_in()){
			redirect('auth');
		}
    }

    public function faq(){
        $data = [
			'user' => $this->ion_auth->user()->row(),
			'judul'	=> 'FAQ',
			'subjudul'=> '',
        ];
        
        $this->load->view('_templates/dashboard/_header.php', $data);
		$this->load->view('utilities/faq');
		$this->load->view('_templates/dashboard/_footer.php');
    }

    public function panduan(){
        $data = [
			'user' => $this->ion_auth->user()->row(),
			'judul'	=> 'Panduan Tryout',
			'subjudul'=> '',
        ];
        
        $this->load->view('_templates/dashboard/_header.php', $data);
		$this->load->view('utilities/panduan');
		$this->load->view('_templates/dashboard/_footer.php');
    }

    public function bantuan(){
        $data = [
			'user' => $this->ion_auth->user()->row(),
			'judul'	=> 'Bantuan',
			'subjudul'=> '',
        ];
        
        $this->load->view('_templates/dashboard/_header.php', $data);
		$this->load->view('utilities/bantuan');
		$this->load->view('_templates/dashboard/_footer.php');
    }

}

?>