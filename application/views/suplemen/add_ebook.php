<div class="box">
    <div class="box-body">
        <div class="row">
            <div class="col-sm-4">
            </div>
            <div class="col-sm-4">
                <?=form_open('suplemen/tambahEbook')?>
                <div class="form-group">
                    <label for="nama_ebook">Nama Buku</label>
                    <input placeholder="Nama E-Book" type="text" class="form-control" name="nama_ebook">
                    <small class="help-block"></small>
                </div>
                <div class="form-group">
                    <label for="nama_ujian">Deskripsi</label>
                    <input placeholder="Deskripsi" type="text" class="form-control" name="deskripsi">
                    <small class="help-block"></small>
                </div>
                <div class="form-group">
                    <label for="link">Link Download</label>
                    <input placeholder="Link Download" type="text" class="form-control" name="link">
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