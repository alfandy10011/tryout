<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Master_model extends CI_Model {

    public function create($table, $data, $batch = false)
    {
        if($batch === false){
            $insert = $this->db->insert($table, $data);
        }else{
            $insert = $this->db->insert_batch($table, $data);
        }
        return $insert;
    }

    public function update($table, $data, $pk, $id = null, $batch = false)
    {
        if($batch === false){
            $insert = $this->db->update($table, $data, array($pk => $id));
        }else{
            $insert = $this->db->update_batch($table, $data, $pk);
        }
        return $insert;
    }

    public function delete($table, $data, $pk)
    {
        $this->db->where_in($pk, $data);
        return $this->db->delete($table);
    }

    /**
     * Data Kelas
     */

    public function getDataKelas()
    {
        $this->datatables->select('id_kelas, nama_kelas, id_seleksi, nama_seleksi');
        $this->datatables->from('kelas');
        $this->datatables->join('seleksi', 'seleksi_id=id_seleksi');
        $this->datatables->add_column('bulk_select', '<div class="text-center"><input type="checkbox" class="check" name="checked[]" value="$1"/></div>', 'id_kelas, nama_kelas, id_seleksi, nama_seleksi');        
        return $this->datatables->generate();
    }

    public function getKelasById($id)
    {
        $this->db->where_in('id_kelas', $id);
        $this->db->order_by('nama_kelas');
        $query = $this->db->get('kelas')->result();
        return $query;
    }

    /**
     * Data Jurusan
     */

    public function getDataJurusan()
    {
        $this->datatables->select('id_seleksi, nama_seleksi');
        $this->datatables->from('seleksi');
        $this->datatables->add_column('bulk_select', '<div class="text-center"><input type="checkbox" class="check" name="checked[]" value="$1"/></div>', 'id_seleksi, nama_seleksi');
        return $this->datatables->generate();
    }

    public function getJurusanById($id)
    {
        $this->db->where_in('id_seleksi', $id);
        $this->db->order_by('nama_seleksi');
        $query = $this->db->get('seleksi')->result();
        return $query;
    }

    /**
     * Data Mahasiswa
     */

    public function getDataMahasiswa()
    {
        $this->datatables->select('a.id_member, a.nama, a.username, a.email, b.nama_kelas, c.nama_seleksi');
        $this->datatables->select('(SELECT COUNT(id) FROM users WHERE username = a.username) AS ada');
        $this->datatables->from('member a');
        $this->datatables->join('kelas b', 'a.kelas_id=b.id_kelas');
        $this->datatables->join('seleksi c', 'b.seleksi_id=c.id_seleksi');
        return $this->datatables->generate();
    }

    public function getMahasiswaById($id)
    {
        $this->db->select('*');
        $this->db->from('member');
        $this->db->join('kelas', 'kelas_id=id_kelas');
        $this->db->join('seleksi', 'seleksi_id=id_seleksi');
        $this->db->where(['id_member' => $id]);
        return $this->db->get()->row();
    }

    public function getJurusan()
    {
        $this->db->select('id_seleksi, nama_seleksi');
        $this->db->from('kelas');
        $this->db->join('seleksi', 'seleksi_id=id_seleksi');
        $this->db->order_by('nama_seleksi', 'ASC');
        $this->db->group_by('id_seleksi');
        $query = $this->db->get();
        return $query->result();
    }

    public function getAllJurusan($id = null)
    {
        if($id === null){
            $this->db->order_by('nama_seleksi', 'ASC');
            return $this->db->get('seleksi')->result();    
        }else{
            $this->db->select('seleksi_id');
            $this->db->from('seleksi_mataujian');
            $this->db->where('mataujian_id', $id);
            $seleksi = $this->db->get()->result();
            $id_seleksi = [];
            foreach ($seleksi as $j) {
                $id_seleksi[] = $j->seleksi_id;
            }
            if($id_seleksi === []){
                $id_seleksi = null;
            }
            
            $this->db->select('*');
            $this->db->from('seleksi');
            $this->db->where_not_in('id_seleksi', $id_seleksi);
            $mataujian = $this->db->get()->result();
            return $mataujian;
        }
    }

    public function getKelasByJurusan($id)
    {
        $query = $this->db->get_where('kelas', array('seleksi_id'=>$id));
        return $query->result();
    }

    /**
     * Data Dosen
     */

    public function getDataDosen()
    {
        $this->datatables->select('a.id_dosen,a.nip, a.nama_dosen, a.email, a.mataujian_id, b.nama_mataujian, (SELECT COUNT(id) FROM users WHERE username = a.nip OR email = a.email) AS ada');
        $this->datatables->from('dosen a');
        $this->datatables->join('mataujian b', 'a.mataujian_id=b.id_mataujian');
        return $this->datatables->generate();
    }

    public function getDosenById($id)
    {
        $query = $this->db->get_where('dosen', array('id_dosen'=>$id));
        return $query->row();
    }

    /**
     * Data Matkul
     */

    public function getDataMatkul()
    {
        $this->datatables->select('id_mataujian, nama_mataujian');
        $this->datatables->from('mataujian');
        return $this->datatables->generate();
    }

    public function getAllMatkul()
    {
        return $this->db->get('mataujian')->result();
    }

    public function getMatkulById($id, $single = false)
    {
        if($single === false){
            $this->db->where_in('id_mataujian', $id);
            $this->db->order_by('nama_mataujian');
            $query = $this->db->get('mataujian')->result();
        }else{
            $query = $this->db->get_where('mataujian', array('id_mataujian'=>$id))->row();
        }
        return $query;
    }

    /**
     * Data Kelas Dosen
     */

    public function getKelasDosen()
    {
        $this->datatables->select('kelas_dosen.id, dosen.id_dosen, dosen.nip, dosen.nama_dosen, GROUP_CONCAT(kelas.nama_kelas) as kelas');
        $this->datatables->from('kelas_dosen');
        $this->datatables->join('kelas', 'kelas_id=id_kelas');
        $this->datatables->join('dosen', 'dosen_id=id_dosen');
        $this->datatables->group_by('dosen.nama_dosen');
        return $this->datatables->generate();
    }

    public function getAllDosen($id = null)
    {
        $this->db->select('dosen_id');
        $this->db->from('kelas_dosen');
        if($id !== null){
            $this->db->where_not_in('dosen_id', [$id]);
        }
        $dosen = $this->db->get()->result();
        $id_dosen = [];
        foreach ($dosen as $d) {
            $id_dosen[] = $d->dosen_id;
        }
        if($id_dosen === []){
            $id_dosen = null;
        }

        $this->db->select('id_dosen, nip, nama_dosen');
        $this->db->from('dosen');
        $this->db->where_not_in('id_dosen', $id_dosen);
        return $this->db->get()->result();
    }

    
    public function getAllKelas()
    {
        $this->db->select('id_kelas, nama_kelas, nama_seleksi');
        $this->db->from('kelas');
        $this->db->join('seleksi', 'seleksi_id=id_seleksi');
        $this->db->order_by('nama_kelas');
        return $this->db->get()->result();
    }
    
    public function getKelasByDosen($id)
    {
        $this->db->select('kelas.id_kelas');
        $this->db->from('kelas_dosen');
        $this->db->join('kelas', 'kelas_dosen.kelas_id=kelas.id_kelas');
        $this->db->where('dosen_id', $id);
        $query = $this->db->get()->result();
        return $query;
    }
    /**
     * Data Jurusan Matkul
     */

    public function getJurusanMatkul()
    {
        $this->datatables->select('seleksi_mataujian.id, mataujian.id_mataujian, mataujian.nama_mataujian, seleksi.id_seleksi, GROUP_CONCAT(seleksi.nama_seleksi) as nama_seleksi');
        $this->datatables->from('seleksi_mataujian');
        $this->datatables->join('mataujian', 'mataujian_id=id_mataujian');
        $this->datatables->join('seleksi', 'seleksi_id=id_seleksi');
        $this->datatables->group_by('mataujian.nama_mataujian');
        return $this->datatables->generate();
    }

    public function getMatkul($id = null)
    {
        $this->db->select('mataujian_id');
        $this->db->from('seleksi_mataujian');
        if($id !== null){
            $this->db->where_not_in('mataujian_id', [$id]);
        }
        $mataujian = $this->db->get()->result();
        $id_mataujian = [];
        foreach ($mataujian as $d) {
            $id_mataujian[] = $d->mataujian_id;
        }
        if($id_mataujian === []){
            $id_mataujian = null;
        }

        $this->db->select('id_mataujian, nama_mataujian');
        $this->db->from('mataujian');
        $this->db->where_not_in('id_mataujian', $id_mataujian);
        return $this->db->get()->result();
    }

    public function getJurusanByIdMatkul($id)
    {
        $this->db->select('seleksi.id_seleksi');
        $this->db->from('seleksi_mataujian');
        $this->db->join('seleksi', 'seleksi_mataujian.seleksi_id=seleksi.id_seleksi');
        $this->db->where('mataujian_id', $id);
        $query = $this->db->get()->result();
        return $query;
    }
}