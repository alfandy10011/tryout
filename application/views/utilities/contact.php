<?= $this->session->flashdata('pesan'); ?>

<div class="container">
    <div class="row">
        <div class="col-sm-6">
            <form method="post" action="<?php base_url('utilities/contact') ?>" id="kritikmasukan" class="animated fadeIn slow">
                <div class="form-group">
                    <label for="judul">Judul</label>
                    <input type="text" class="form-control" id="judul" name="judul" placeholder="Judul">
                    <?= form_error('judul'); ?>
                </div>
                <div class="form-group">
                    <label for="nama">Nama</label>
                    <input type="text" class="form-control" id="nama" name="nama" placeholder="Nama Kamu">
                    <?= form_error('nama'); ?>
                </div>
                <div class="form-group">
                    <label for="email">Email address</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Email kalian">
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                    <?= form_error('email'); ?>
                </div>
                <div class="form-group">
                    <label for="kritik">Kritik & Masukan</label>
                    <textarea class="form-control" rows="6" id="kritik" name="kritik"></textarea>
                </div>
                <?= form_error('kritik'); ?>
                <button type="submit" class="btn btn-primary">Kirim</button>
            </form>
        </div>
    </div>
</div>