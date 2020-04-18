<div class="card shadow mb-4">
	<div class="card-header py-3">
        <h3 class="box-title">Relasi <?=$subjudul?></h3>
    </div>
    <div class="card-body">
        <div class="mt-2 mb-3">
            <a href="<?=base_url('seleksimataujian/add')?>" class="btn btn-sm btn-flat btn-primary"><i class="fa fa-plus"></i> Tambah Data</a>
            <button type="button" onclick="reload_ajax()" class="btn btn-sm btn-flat btn-info"><i class="fa fa-refresh"></i> Reload</button>
			<div class="float-right">
				<button onclick="bulk_delete()" class="btn btn-sm btn-flat btn-danger" type="button"><i class="fa fa-trash"></i> Delete</button>
			</div>
        </div>
    </div>
	<?=form_open('',array('id'=>'bulk'))?>
	<div class="table-responsive px-4 pb-3" style="border:0">
	<table id="seleksimataujian" class="w-100 table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>No.</th>
				<th>Mata Ujian</th>
				<th>Seleksi</th>
				<th class="text-center">Edit</th>
				<th class="text-center">
					<input type="checkbox" class="select_all">
				</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th>No.</th>
				<th>Mata Ujian</th>
				<th>Seleksi</th>
				<th class="text-center">Edit</th>
				<th class="text-center">
					<input type="checkbox" class="select_all">
				</th>
			</tr>
		</tfoot>
	</table>
	</div>
	<?=form_close()?>
</div>

<script src="<?=base_url()?>assets/dist/js/app/relasi/seleksimataujian/data.js"></script>