<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h3 class="box-title">Form <?=$judul?></h3>
        <div class="box-tools pull-right">
            <a href="<?=base_url()?>seleksimataujian" class="btn btn-warning btn-flat btn-sm">
                <i class="fa fa-arrow-left"></i> Batal
            </a>
        </div>
    </div>
    <div class="card-body">
        <div class="row justify-content-center">
            <div class="col-sm-4">
                <div class="alert bg-purple">
                    <h4><i class="fa fa-info-circle"></i> Informasi</h4>
                    Jika kolom Mata Kuliah kosong, berikut ini kemungkinan penyebabnya :
                    <br><br>
                    <ol class="pl-4">
                        <li>Anda belum menambahkan master data Mata Kuliah (Master Mata Kuliah kosong/belum ada data sama sekali).</li>
                        <li>Mata Kuliah sudah ditambahkan, jadi anda tidak perlu tambah lagi. Anda hanya perlu mengedit data Jurusan Mata Kuliah nya saja.</li>
                    </ol>
                </div>
            </div>
            <div class="col-sm-4">
                <?=form_open('seleksimataujian/save', array('id'=>'seleksimataujian'), array('method'=>'add'))?>
                <div class="form-group">
                    <label>Mata Kuliah</label>
                    <select name="mataujian_id" class="form-control select2" style="width: 100%!important">
                        <option value="" disabled selected></option>
                        <?php foreach ($mataujian as $m) : ?>
                            <option value="<?=$m->id_mataujian?>"><?=$m->nama_mataujian?></option>
                        <?php endforeach; ?>
                    </select>
                    <small class="help-block text-right"></small>
                </div>
                <div class="form-group">
                    <label>Jurusan</label>
                    <select id="seleksi" multiple="multiple" name="seleksi_id[]" class="form-control select2" style="width: 100%!important">
                    </select>
                    <small class="help-block text-right"></small>
                </div>
                <div class="form-group float-right">
                    <button type="reset" class="btn btn-flat btn-info">
                        <i class="fa fa-rotate-left"></i> Reset
                    </button>
                    <button id="submit" type="submit" class="btn btn-success bg-purple">
                        <i class="fa fa-save"></i> Simpan
                    </button>
                </div>
                <?=form_close()?>
            </div>
        </div>
    </div>
</div>

<script src="<?=base_url()?>assets/dist/js/app/relasi/seleksimataujian/add.js"></script>