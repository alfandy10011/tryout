<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h3 class="box-title">Master Data E-Book</h3>
    </div>
    <div class="card-body">
        <div class="mt-2 mb-3">
            <a href="<?= base_url('suplemen/add_ebook') ?>" class="btn btn-sm btn-success float-right bg-purple mb-3"><i class="fa fa-plus"></i> Tambah</a>
        </div>
        <?= form_open('suplemen/delete', array('id' => 'bulk')); ?>
        
        <section class="content">
            <table class="table table-striped">
                <tr>
                    <th>No</th>
                    <th>Nama E-Book</th>
                    <th>Deskripsi</th>
                    <th>Link</th>
                    <th colspan="2">Aksi</th>
                </tr>

                <?php 
                
                $no = 1;
                foreach ($list as $l) : ?>
                <tr>
                    <td><?php echo $no++ ?></td>
                    <td><?php echo $l->nama ?></td>
                    <td><?php echo $l->deskripsi ?></td>
                    <td><?php echo $l->link ?></td>
                    <td class="px-0 mx-0" onclick="javascript: return confirm('Yakin mau hapus ebook?')"><a href="<?= base_url('suplemen/delete/'.$l->id) ?>" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></a></td>
                    <td class="px-0 mx-0" ><a href="<?= base_url('suplemen/edit/'.$l->id) ?>" class="btn btn-sm btn-info"><i class="fa fa-pen"></i></a></td>
                </tr>
                    
                <?php endforeach; ?>
            </table>
        </section>

        <?= form_close() ?>
    </div>
</div>

<script src="<?= base_url() ?>assets/dist/js/app/suplemen/ebook.js"></script>