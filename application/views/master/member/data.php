<div class="card shadow mb-4">
	<div class="card-header py-3">
        <h3 class="box-title">Master <?= $subjudul ?></h3>
    </div>
    <div class="card-body">
        <div class="mt-2 mb-3">
            <a href="<?= base_url('member/add') ?>" class="btn btn-sm btn-flat btn-primary"><i class="fa fa-plus"></i> Tambah</a>
            <a href="<?= base_url('member/import') ?>" class="btn btn-sm btn-flat btn-success"><i class="fa fa-upload"></i> Import</a>
            <button type="button" onclick="reload_ajax()" class="btn btn-sm btn-flat btn-info"><i class="fa fa-refresh"></i> Reload</button>
            <div class="float-right">
                <button onclick="bulk_delete()" class="btn btn-sm btn-flat btn-danger" type="button"><i class="fa fa-trash"></i> Delete</button>
            </div>
        </div>
        <?= form_open('member/delete', array('id' => 'bulk')); ?>
        <div class="table-responsive">
            <table id="member" class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Username</th>
                        <th>Nama</th>
                        <th>Email</th>
                        <th>Kelas</th>
                        <th>Jurusan</th>
                        <th width="100" class="text-center">Aksi</th>
                        <th width="100" class="text-center">
                            <input class="select_all" type="checkbox">
                        </th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>No.</th>
                        <th>Username</th>
                        <th>Nama</th>
                        <th>Email</th>
                        <th>Kelas</th>
                        <th>Jurusan</th>
                        <th width="100" class="text-center">Aksi</th>
                        <th width="100" class="text-center">
                            <input class="select_all" type="checkbox">
                        </th>
                    </tr>
                </tfoot>
            </table>
        </div>
        <?= form_close() ?>
    </div>
</div>

<script src="<?= base_url() ?>assets/dist/js/app/master/member/data.js"></script>