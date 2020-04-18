<!--
<div class="row"> -->
<!-- <div class="col-sm-3">
        <div class="alert bg-green">
            <h4>Ujian Seleksi<i class="pull-right fa fa-building-o"></i></h4>
            <span class="d-block"> <?= $mhs->nama_kelas ?></span>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="alert bg-blue">
            <h4>Tipe Ujian<i class="pull-right fa fa-graduation-cap"></i></h4>
            <span class="d-block"> <?= $mhs->nama_seleksi ?></span>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="alert bg-yellow">
            <h4>Tanggal<i class="pull-right fa fa-calendar"></i></h4>
            <span class="d-block"> <?= strftime('%A, %d %B %Y') ?></span>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="alert bg-red">
            <h4>Jam<i class="pull-right fa fa-clock-o"></i></h4>
            <span class="d-block"> <span class="live-clock"><?= date('H:i:s') ?></span></span>
        </div>
    </div> -->
<!-- <div class="col-sm-12"> -->
<!-- <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary"><?= $subjudul ?></h6>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-4">
                        <button type="button" onclick="reload_ajax()" class="btn btn-sm btn-flat bg-purple"><i class="fa fa-refresh"></i> Reload</button>
                    </div>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered" id="ujian" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Nama Tryout</th>
                        <th>Jumlah Soal</th>
                        <th>Waktu</th>
                        <th>Token</th>
                        <th class="text-center">Aksi</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>No.</th>
                        <th>Nama Tryout</th>
                        <th>Jumlah Soal</th>
                        <th>Waktu</th>
                        <th>Token</th>
                        <th class="text-center">Aksi</th>
                    </tr>
                </tfoot>
                </table>
            </div>
        </div> -->


<!-- <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary"><?= $subjudul ?></h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="ujian" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                        <th>Nama Tryout</th>
                        <th>Jumlah Soal</th>
                        <th>Token</th>
                        <th class="text-center">Aksi</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                        <th>Nama Tryout</th>
                        <th>Jumlah Soal</th>
                        <th>Token</th>
                        <th class="text-center">Aksi</th>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
          </div> -->
<!-- </div> -->
<!-- </div> -->

<!-- <script src="<?= base_url() ?>assets/dist/js/app/ujian/list.js"></script> -->

<div class="row justify-content-start">

  <?php foreach ($ujian as $u) : ?>

    <div class="col-sm-3 mx-3 my-2">
      <div class="card animated fadeIn fast" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title text-primary"><?= $u->nama_ujian ?></h5>
          <p class="card-text">Jumlah Soal : <strong><?= $u->jumlah_soal ?></strong></p>
          <p class="card-text">Waktu : <strong><?= $u->waktu ?> Menit</strong></p>

          <?php if ($u->id_hasil_ujian == null) : ?>
            <a href="<?= base_url('ujian/index/' . $u->id_ujian) ?>" class="btn btn-primary btn-sm">Kerjakan</a>
          <?php elseif (!$u->selesai) : ?>
            <a href="<?= base_url('ujian/index/' . $u->id_ujian) ?>" class="btn btn-info btn-sm">Lanjutkan</a>
          <?php else : ?>
            <a href="<?= base_url('ujian/lihat_hasil/' . $u->id_ujian) ?>" class="btn btn-success btn-sm">Lihat Hasil</a>
            <a href="<?= base_url('ujian/pembahasan/' . $u->mataujian_id) ?>" class="btn btn-info btn-sm">Lihat Pembahasan</a>
          <?php endif; ?>
        </div>
      </div>
    </div>

  <?php endforeach ?>
</div>
