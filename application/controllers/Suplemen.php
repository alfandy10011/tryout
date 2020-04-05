<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Suplemen extends CI_Controller{
    public function __construct(){
        parent::__construct();
        if (!$this->ion_auth->logged_in()){
			redirect('auth');
		}else if ( !$this->ion_auth->is_admin() && !$this->ion_auth->in_group('dosen') ){
			show_error('Hanya Administrator dan dosen yang diberi hak untuk mengakses halaman ini, <a href="'.base_url('dashboard').'">Kembali ke menu awal</a>', 403, 'Akses Terlarang');
		}
        
        $this->load->model('Master_model', 'master');
        $this->load->model('Suplemen_model', 'suplemen');
    }

    public function index(){

        $data = [
            'user'  => $this->ion_auth->user()->row(),
            'judul' => 'Master E-Book',
            'subjudul'  => '',
            'list'  => $this->suplemen->tampilEbook()->result(),
        ];

        $this->load->view('_templates/dashboard/_header.php', $data);
		$this->load->view('suplemen/data', $data);
		$this->load->view('_templates/dashboard/_footer.php');

    }

    public function add_ebook(){
        $data = [
            'user'  => $this->ion_auth->user()->row(),
            'judul' => 'Tambah Buku',
            'subjudul'  => '',
        ];

        $this->load->view('_templates/dashboard/_header.php', $data);
		$this->load->view('suplemen/add_ebook');
		$this->load->view('_templates/dashboard/_footer.php');
    }

    public function tambahEbook(){

        $this->load->helper('String');

        $nama_ebook = $this->input->post('nama_ebook', true);
        $deskripsi = $this->input->post('deskripsi', true);
        $link = $this->input->post('link', true);

        $input = [
            'nama'  => $nama_ebook,
            'deskripsi' => $deskripsi,
            'link'  => $link,
        ];

        $this->master->create('ebook', $input);

        return redirect(base_url('suplemen')); 

    }

    public function delete($id){
        $where = array('id' => $id);
        $this->suplemen->hapusEbook($where, 'ebook');
        return redirect(base_url('suplemen'));
    }

    public function edit($id){

        $where = array('id' => $id);
        $data = [
            'list' => $this->suplemen->edit_data($where,'ebook')->result(),
            'user'  => $this->ion_auth->user()->row(),
            'judul' => 'Edit Buku',
            'subjudul'  => '',
        ];

        $this->load->view('_templates/dashboard/_header.php', $data);
		$this->load->view('suplemen/edit', $data);
		$this->load->view('_templates/dashboard/_footer.php');

    }

    public function update(){

        $this->load->helper('string');

        $id = $this->input->post('id');
        $nama_ebook = $this->input->post('nama_ebook', true);
        $deskripsi = $this->input->post('deskripsi', true);
        $link = $this->input->post('link', true);

        $input = [
            'nama'  => $nama_ebook,
            'deskripsi' => $deskripsi,
            'link'  => $link,
        ];

        $where = array(
            'id' => $id,
        );

        $this->suplemen->update_data($where, $input, 'ebook');
        return redirect(base_url('suplemen'));

    }

}

?>