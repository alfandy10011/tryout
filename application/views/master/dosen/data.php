<div class="card shadow mb-4">
	<div class="card-header py-3">
        <h3 class="box-title">Master <?= $subjudul ?></h3>
    </div>
    <div class="card-body">
        <div class="mt-2 mb-4">
            <a href="<?= base_url('dosen/add') ?>" class="btn btn-sm bg-purple btn-primary"><i class="fa fa-plus"></i> Tambah Data</a>
            <a href="<?= base_url('dosen/import') ?>" class="btn btn-sm btn-flat btn-success"><i class="fa fa-upload"></i> Import</a>
            <button type="button" onclick="reload_ajax()" class="btn btn-sm btn-info btn-flat"><i class="fa fa-refresh"></i> Reload</button>
            <div class="float-right">
                <button onclick="bulk_delete()" class="btn btn-sm btn-danger btn-flat" type="button"><i class="fa fa-trash"></i> Delete</button>
            </div>
        </div>
        <?= form_open('dosen/delete', array('id' => 'bulk')) ?>
        <table id="dosen" class="w-100 table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>NIP</th>
                    <th>Nama Dosen</th>
                    <th>Email</th>
                    <th>Mata Kuliah</th>
                    <th class="text-center">Action</th>
                    <th class="text-center">
                        <input type="checkbox" class="select_all">
                    </th>
                </tr>
            </thead>
            <tbody></tbody>
            <tfoot>
                <tr>
                    <th>No.</th>
                    <th>NIP</th>
                    <th>Nama Dosen</th>
                    <th>Email</th>
                    <th>Mata Kuliah</th>
                    <th class="text-center">Action</th>
                    <th class="text-center">
                        <input type="checkbox" class="select_all">
                    </th>
                </tr>
            </tfoot>
        </table>
        <?= form_close() ?>
    </div>
</div>

<script src="<?= base_url() ?>assets/dist/js/app/master/dosen/data.js"></script>