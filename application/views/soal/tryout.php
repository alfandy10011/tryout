<div class="box">
    <div class="box-body">
        <div class="row">
            <div class="col-sm-4">
            </div>
            <div class="col-sm-4">
                <?=form_open('soal/buatTryout')?>
                <div class="form-group">
                    <label for="tryout_id">ID Tryout</label>
                    <input placeholder="ID Tryout" type="number" class="form-control" name="tryout_id">
                    <small class="help-block"></small>
                </div>
                <div class="form-group">
                    <label for="nama_ujian">Nama Tryout</label>
                    <input autofocus="autofocus" onfocus="this.select()" placeholder="Nama Tryout" type="text" class="form-control" name="nama_tryout">
                    <small class="help-block"></small>
                </div>
                <div class="form-group text-center">
                    <button type="reset" class="btn btn-warning btn-flat">
                        <i class="fa fa-rotate-left"></i> Reset
                    </button>
                    <button id="submit" type="submit" class="btn btn-success bg-purple"><i class="fa fa-save"></i> Simpan</button>
                </div>
                <?=form_close()?>
            </div>
        </div>
    </div>
</div>

<script src="<?=base_url()?>assets/dist/js/app/ujian/add.js"></script>