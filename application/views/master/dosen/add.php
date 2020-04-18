<?=form_open('dosen/save', array('id'=>'formdosen'), array('method'=>'add'));?>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h3 class="box-title">Form <?=$subjudul?></h3>
        <div class="box-tools pull-right">
            <a href="<?=base_url()?>dosen" class="btn btn-sm btn-flat btn-warning">
                <i class="fa fa-arrow-left"></i> Batal
            </a>
        </div>
    </div>
    <div class="card-body">
        <div class="row justify-content-center">
            <div class="col-sm-4 col-sm-offset-4">
                <div class="form-group">
                    <label for="nip">NIP</label>
                    <input autofocus="autofocus" onfocus="this.select()" type="number" id="nip" class="form-control" name="nip" placeholder="NIP">
                    <small class="help-block"></small>
                </div>
                <div class="form-group">
                    <label for="nama_dosen">Nama Dosen</label>
                    <input type="text" class="form-control" name="nama_dosen" placeholder="Nama Dosen">
                    <small class="help-block"></small>
                </div>
                <div class="form-group">
                    <label for="email">Email Dosen</label>
                    <input type="text" class="form-control" name="email" placeholder="Email Dosen">
                    <small class="help-block"></small>
                </div>
                <div class="form-group">
                    <label for="mataujian">Mata Kuliah</label>
                    <select name="mataujian" id="mataujian" class="form-control select2" style="width: 100%!important">
                        <option value="" disabled selected>Pilih Mata Kuliah</option>
                        <?php foreach ($mataujian as $row) : ?>
                            <option value="<?=$row->id_mataujian?>"><?=$row->nama_mataujian?></option>
                        <?php endforeach; ?>
                    </select>
                    <small class="help-block"></small>
                </div>
                <div class="form-group float-right">
                    <button type="reset" class="btn btn-flat btn-info">
                        <i class="fa fa-rotate-left"></i> Reset
                    </button>
                    <button type="submit" id="submit" class="btn btn-flat btn-success">
                        <i class="fa fa-save"></i> Simpan
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<?=form_close();?>

<script src="<?=base_url()?>assets/dist/js/app/master/dosen/add.js"></script>