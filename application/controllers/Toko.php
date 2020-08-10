<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Toko extends CI_Controller{
    public function __construct(){
        parent::__construct();
        if (!$this->ion_auth->logged_in()){
			redirect('auth');
		}
    }

    public function paket(){
        $data = [
			'user' => $this->ion_auth->user()->row(),
			'judul'	=> 'Paket Tryout',
			'subjudul'=> '',
        ];
        
        $this->load->view('_templates/dashboard/_header.php', $data);
		$this->load->view('toko/paket');
		$this->load->view('_templates/dashboard/_footer.php');
    }
}

?>