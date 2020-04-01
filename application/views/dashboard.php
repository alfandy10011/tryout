<?php if( $this->ion_auth->is_admin() ) : ?>
<div class="row">
    <?php foreach($info_box as $info) : ?>
    <div class="col-lg-3 col-xs-6">
        <div class="small-box bg-<?=$info->box?>">
        <div class="inner">
            <h3><?=$info->total;?></h3>
            <p><?=$info->title;?></p>
        </div>
        <div class="icon">
            <i class="fa fa-<?=$info->icon?>"></i>
        </div>
        <a href="<?=base_url().strtolower($info->title);?>" class="small-box-footer">
            More info <i class="fa fa-arrow-circle-right"></i>
        </a>
        </div>
    </div>
    <?php endforeach; ?>
</div>

<?php elseif( $this->ion_auth->in_group('dosen') ) : ?>

<div class="row">
    <div class="col-sm-4">
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Informasi Akun</h3>
            </div>
            <table class="table table-hover">
                <tr>
                    <th>Nama</th>
                    <td><?=$dosen->nama_dosen?></td>
                </tr>
                <tr>
                    <th>ID</th>
                    <td><?=$dosen->nip?></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><?=$dosen->email?></td>
                </tr>
                <tr>
                    <th>Jenis</th>
                    <td><?=$dosen->nama_matkul?></td>
                </tr>
                <tr>
                    <th>Ujian Seleksi</th>
                    <td>
                        <ol class="pl-4">
                        <?php foreach ($kelas as $k) : ?>
                            <li><?=$k->nama_kelas?></li>
                        <?php endforeach;?>
                        </ol>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="col-sm-8">
        <div class="box box-solid">
            <div class="box-header bg-purple">
                <h3 class="box-title">Pemberitahuan</h3>
            </div>
            <div class="box-body">
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quidem in animi quibusdam nihil esse ratione, nulla sint enim natus, aut mollitia quas veniam, tempore quia!</p>
                <ul class="pl-4">
                    <li>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur, culpa.</li>
                    <li>Provident dolores doloribus, fugit aperiam alias tempora saepe non omnis.</li>
                    <li>Doloribus sed eum et repellat distinctio a repudiandae quia voluptates.</li>
                    <li>Adipisci hic rerum illum odit possimus voluptatibus ad aliquid consequatur.</li>
                    <li>Laudantium sapiente architecto excepturi beatae est minus, labore non libero.</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<?php else : ?>

<div class="row">
    <div class="col-sm-4">
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Informasi Akun</h3>
                <a class="btn btn-success btn-xs ml-auto" href="<?=base_url('profil/edit')?>"> Edit Profil </a>
            </div>
            <table class="table table-hover">
                <tr>
                    <th>ID</th>
                    <td><?=$mahasiswa->nim?></td>
                </tr>
                <tr>
                    <th>Nama</th>
                    <td><?=$mahasiswa->nama?></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><?=$mahasiswa->email?></td>
                </tr>
                <tr>
                    <th>Asal Sekolah</th>
                    <td><?=$mahasiswa->sekolah?></td>
                </tr>
                <tr>
                    <th>Pilihan 1</th>
                    <td><?=$pilihan_1?></td>
                </tr>
                <tr>
                    <th>Pilihan 2</th>
                    <td><?=$pilihan_2?></td>
                </tr>
                <tr>
                    <th>Pilihan 3</th>
                    <td><?=$pilihan_3?></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="col-sm-8">
        <div class="box box-solid">
            <div class="box-header bg-purple">
                <h3 class="box-title">Petunjuk Pengerjaan Tryout</h3>
            </div>
            <div class="box-body">
                <p>Petunjuk teknis pengerjaan Tryout SPMB PKN STAN</p>
                <ul class="pl-4">
                    <li>Jenis Ujian terdiri dari TPA, TBI, SKD (TWK, TIU, TKP)</li>
                    <li>TPA (Test Potensi Akademik) waktu pengerjaan 40 menit dengan 45 butir soal. Benar +4 Salah -1 Ambang Batas 67 </li>
                    <li>TBI (Test Bahasa Inggris) waktu pengerjaan 20 menit dengan 30 butir soal. Benar +5 Salah -0 Ambang Batas 30</li>
                    <l1>SKD Terdiri dari TWK, TIU, dan TKP dengan waktu pengerjaan 90 menit </li>
                    <li>TWK (Test Wawasan Kebangsaan) 35 butir soal. Benar +5 Salah -0 Ambang Batas 75</li>
                    <li>TIU (Test Intelegensia Umum) 30 butir soal. Benar +5 Salah -0 Ambang Batas 80</li>
                    <li>TKP (Test Karakteristik Pribadi) 35 butir soal. Nilai terendah 1 dan tertinggi 5 Ambang Batas 143</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<?php endif; ?>