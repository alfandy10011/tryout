<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h3 class="box-title">Form <?=$judul?></h3>
    </div>
    <div class="card-body">
        <div class="row justify-content-center">
            <div class="col-sm-offset-4 col-sm-4">
                <div class="my-2">
                    <div class="form-horizontal form-inline">
                        <a href="<?=base_url('matkul')?>" class="btn btn-info btn-xs">
                            <i class="fa fa-arrow-left"></i> Batal
                        </a>
                        <div class="ml-auto">
                            <span> Jumlah : </span><label for=""><?=count($matkul)?></label>
                        </div>
                    </div>
                </div>
                <?=form_open('matkul/save', array('id'=>'matkul'), array('mode'=>'edit'))?>
                <table id="form-table" class="table text-center table-condensed">
                    <thead>
                        <tr>
                            <th># No</th>
                            <th>Matkul</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                        $no = 1;
                        foreach ($matkul as $row) : ?>
                        <tr>
                            <td><?=$no?></td>
                            <td>
                                <div class="form-group">
                                    <?=form_hidden('id_matkul['.$no.']', $row->id_matkul)?>
                                    <input autofocus="autofocus" onfocus="this.select()" autocomplete="off" value="<?=$row->nama_matkul?>" type="text" name="nama_matkul[<?=$no?>]" class="input-sm form-control">
                                    <small class="help-block text-right"></small>
                                </div>
                            </td>
                        </tr>
                        <?php 
                        $no++;
                        endforeach; 
                        ?>
                    </tbody>
                </table>
                <button type="submit" class="mb-4 btn btn-block btn-flat btn-success">
                    <i class="fa fa-save"></i> Simpan Perubahan
                </button>
                <?=form_close()?>
            </div>
        </div>
    </div>
</div>

<script src="<?=base_url()?>assets/dist/js/app/master/matkul/edit.js"></script>