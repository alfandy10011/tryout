<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h3 class="box-title">Form <?=$judul?></h3>
    </div>
    <div class="card-body">
        <div class="row justify-content-center">
            <div class="col-sm-offset-4 col-sm-4">
                <div class="my-2">
                    <div class="form-horizontal form-inline">
                        <a href="<?=base_url('mataujian')?>" class="btn btn-info btn-xs">
                            <i class="fa fa-arrow-left"></i> Batal
                        </a>
                        <div class="ml-auto">
                            <span> Jumlah : </span><label for=""><?=$banyak?></label>
                        </div>
                    </div>
                </div>
                <?=form_open('mataujian/save', array('id'=>'mataujian'), array('mode'=>'add'))?>
                <table id="form-table" class="table text-center table-condensed">
                    <thead>
                        <tr>
                            <th># No</th>
                            <th>Mata Kuliah</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php for ($i=1; $i <= $banyak; $i++) : ?> 
                            <tr>
                                <td><?=$i?></td>
                                <td>
                                    <div class="form-group">
                                        <input autofocus="autofocus" onfocus="this.select()" autocomplete="off" type="text" name="nama_mataujian[<?=$i?>]" class="form-control">
                                        <small class="help-block text-right"></small>
                                    </div>
                                </td>
                            </tr>
                        <?php endfor; ?>
                    </tbody>
                </table>
                <button id="submit" type="submit" class="mb-4 btn btn-block btn-flat btn-success">
                    <i class="fa fa-save"></i> Simpan
                </button>
                <?=form_close()?>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var inputs ='';
    var banyak = '<?=$banyak;?>';
</script>

<script src="<?=base_url()?>assets/dist/js/app/master/mataujian/add.js"></script>