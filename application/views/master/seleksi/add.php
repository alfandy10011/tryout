<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h3 class="box-title">Form <?=$judul?></h3>
    </div>
    <div class="card-body">
        <div class="row justify-content-center">
            <div class="col-sm-6">     
                <div class="my-4">
                    <div class="form-horizontal form-inline">
                        <a href="<?=base_url('seleksi')?>" class="btn btn-info btn-xs">
                            <i class="fa fa-arrow-left"></i> Batal
                        </a>
                        <div class="ml-auto">
                            <span> Jumlah : </span><label for=""><?=$banyak?></label>
                        </div>
                    </div>
                </div>
                <?=form_open('seleksi/save', array('id'=>'seleksi'), array('mode'=>'add'))?>
                <table id="form-table" class="table text-center table-condensed">
                    <thead>
                        <tr>
                            <th># No</th>
                            <th>Seleksi</th>
                        </tr>
                    </thead>
                    <tbody id="inputs">
                    </tbody>
                </table>
                <button type="submit" class="mb-4 btn btn-block btn-success">
                    <i class="fa fa-save"></i> Simpan
                </button>
                <?=form_close()?>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var inputs = '';
    var banyak = '<?=$banyak;?>';
</script>
<script src="<?=base_url()?>assets/dist/js/app/master/seleksi/add.js"></script>