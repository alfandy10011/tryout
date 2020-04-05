<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Utilities extends CI_Controller{
    public function __construct(){
        parent::__construct();
        if (!$this->ion_auth->logged_in()){
			redirect('auth');
        }
        
        $this->load->model('Master_model', 'master');
        $this->load->model('Suplemen_model', 'suplemen');
        $this->load->library('session');
        $this->load->database();
        $this->load->library('form_validation');
        $this->load->helper(['url', 'language']);
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

    public function contact(){

        $this->form_validation->set_rules('judul', 'Judul', 'required');
        $this->form_validation->set_rules('nama', 'Nama', 'required');
        $this->form_validation->set_rules('email', 'Email', 'required|valid_email');
        $this->form_validation->set_rules('kritik', 'Kritik dan Masukan', 'required');

        if($this->form_validation->run() == false){
            $data = [
                'user' => $this->ion_auth->user()->row(),
                'judul'	=> 'Kritik & Masukan',
                'subjudul'=> '',
            ];

                $this->load->view('_templates/dashboard/_header.php', $data);
                $this->load->view('utilities/contact');
                $this->load->view('_templates/dashboard/_footer.php');
        }else{
            $this->kirim_contact();
        }
    }

    private function kirim_contact(){

        $config = [
            'protocol'	=> 'smtp',
            'smtp_host'	=> 'ssl://smtp.googlemail.com',
            'smtp_user' => 'ambiseducation@gmail.com',
            'smtp_pass' => 'pratamasatria500',
            'smtp_port' => 465,
            'mailtype'  => 'html',
            'charset' 	=> 'utf-8',
            'newline'	=> "\r\n",
          ];
            
        $this->load->library('email', $config);
        $this->email->initialize($config);
        $this->email->from($this->input->post('email'), $this->input->post('nama'));
        $this->email->to('jalusatria17@gmail.com');
        $this->email->subject($this->input->post('judul'));
        $this->email->message($this->input->post('kritik'));
        $this->email->send();

        $this->session->set_flashdata('pesan', '<div class="alert alert-success alert-dismissible fade show" role="alert">
        Pesan telah terkirim! Terimakasih atas kritik atau masukannya!
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>');

      redirect('utilities/contact');

    }

    public function ebook(){
        $data = [
            'user'  => $this->ion_auth->user()->row(),
            'judul' => 'Download E-Book Gratis',
            'subjudul'  => '',
            'list'  => $this->suplemen->tampilEbook()->result(),
        ];

        $this->load->view('_templates/dashboard/_header.php', $data);
		$this->load->view('utilities/ebook', $data);
		$this->load->view('_templates/dashboard/_footer.php');

    }
}

?>