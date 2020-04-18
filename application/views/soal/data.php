<div class="card shadow mb-4">
	<div class="card-header py-3">
        <h3 class="box-title"><?=$subjudul?></h3>
    </div>
    <div class="card-body">
		<div class="row">
        	<div class="col-sm-4">
				<button type="button" onclick="bulk_delete()" class="btn btn-danger btn-sm bg-red"><i class="fa fa-trash"></i> Bulk Delete</button>
			</div>
			<div class="form-group col-sm-4 text-center">
				<?php if ( $this->ion_auth->is_admin() ) : ?>
					<select id="mataujian_filter" class="form-control select2" style="width:100% !important">
						<option value="all">Semua Matkul</option>
						<?php foreach ($mataujian as $m) :?>
							<option value="<?=$m->id_mataujian?>"><?=$m->nama_mataujian?></option>
						<?php endforeach; ?>
					</select>
				<?php endif; ?>
				<?php if ( $this->ion_auth->in_group('dosen') ) : ?>				
					<input id="mataujian_id" value="<?=$mataujian->nama_mataujian;?>" type="text" readonly="readonly" class="form-control">
				<?php endif; ?>
			</div>
			<div class="col-sm-4">
				<div class="float-right">
					<a href="<?=base_url('soal/add')?>" class="btn bg-purple btn-primary btn-sm"><i class="fa fa-plus"></i> Buat Soal</a>
					<button type="button" onclick="reload_ajax()" class="btn btn-warning btn-sm bg-maroon"><i class="fa fa-refresh"></i> Reload</button>
				</div>
			</div>
		</div>
    </div>
	<?=form_open('soal/delete', array('id'=>'bulk'))?>
    <div class="table-responsive px-4 pb-3" style="border: 0">
        <table id="soal" class="w-100 table table-striped table-bordered table-hover">
        <thead>
            <tr>
				<th class="text-center">
					<input type="checkbox" class="select_all">
				</th>
                <th width="25">No.</th>
				<th>Dosen</th>
                <th>Mata Kuliah</th>
				<th>Soal</th>
				<th>Tgl Dibuat</th>
				<th class="text-center">Aksi</th>
            </tr>        
        </thead>
        <tfoot>
            <tr>
				<th class="text-center">
					<input type="checkbox" class="select_all">
				</th>
                <th width="25">No.</th>
				<th>Dosen</th>
                <th>Mata Kuliah</th>
				<th>Soal</th>
				<th>Tgl Dibuat</th>
				<th class="text-center">Aksi</th>
            </tr>
        </tfoot>
        </table>
    </div>
	<?=form_close();?>
</div>

<script src="<?=base_url()?>assets/dist/js/app/soal/data.js"></script>

<?php if ( $this->ion_auth->is_admin() ) : ?>
<script type="text/javascript">
$(document).ready(function(){
	$('#mataujian_filter').on('change', function(){
		let id_mataujian = $(this).val();
		let src = '<?=base_url()?>soal/data';
		let url;

		if(id_mataujian !== 'all'){
			let src2 = src + '/' + id_mataujian;
			url = $(this).prop('checked') === true ? src : src2;
		}else{
			url = src;
		}
		table.ajax.url(url).load();
	});
});
</script>
<?php endif; ?>
<?php if ( $this->ion_auth->in_group('dosen') ) : ?>
<script type="text/javascript">
$(document).ready(function(){
	let id_mataujian = '<?=$mataujian->mataujian_id?>';
	let id_dosen = '<?=$mataujian->id_dosen?>';
	let src = '<?=base_url()?>soal/data';
	let url = src + '/' + id_mataujian + '/' + id_dosen;

	table.ajax.url(url).load();
});
</script>
<?php endif; ?>