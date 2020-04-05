<div class="row">
    <div class="col-lg-3">
        <div class="card animated fadeIn slow" style="width: 18rem;">
            <img class="card-img-top" src="assets/dist/img/user1.png" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">Nama : <?= $profil->nama ?></h5>
            </div>
            <div class="card-body">
                <p class="text-center">Status : 
                
                <?php if($profil->kelas_id == "1" ) : ?>
                    <strong>FREE</strong>
                <?php else : ?>
                    <strong>PREMIUM</strong>
                <?php endif; ?>        
                 </p>
            </div>
        </div>
    </div>
    <div class="col-lg-9">
    <div class="container">
    <table class="table animated fadeIn slow">
        <thead>
            <tr>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Username</td>
                <td><?= $profil->nim ?></td>
            </tr>
            <tr>
                <td>E-mail</td>
                <td><?= $profil->email ?></td>
            </tr>
            <tr>
                <td>Nama Lengkap</td>
                <td><?= $profil->nama ?></td>
            </tr>
            <tr>
                <td>Sekolah</td>
                <td><?= $profil->sekolah ?></td>
            </tr>
            <tr>
                <td>Pilihan 1</td>
                <td><?= $pilihan_1 ?></td>
            </tr>
            <tr>
                <td>Pilihan 2</td>
                <td><?= $pilihan_2 ?></td>
            </tr>
            <tr>
                <td>Pilihan 3</td>
                <td><?= $pilihan_3 ?></td>
            </tr>
        </tbody>
        </table>
        <!-- <a href="" class="btn btn-primary float-right">Edit Profil</a> -->
        </div>
    </div>
</div>