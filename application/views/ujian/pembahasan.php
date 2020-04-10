<?php $no = 1; ?>

<?php foreach ($pembahasan as $p) : ?>

    <div class="container my-3">
        <div class="card">
            <div class="card-header">
                <?= ++$start ?>
            </div>
            <div class="card-body">
                <p class="card-text"><?= $p->soal ?></p>

                <?php if (empty($p->opsi_e)) : ?>

                    <ol type="A">
                        <li><?= $p->opsi_a ?></li>
                        <li><?= $p->opsi_b ?></li>
                        <li><?= $p->opsi_c ?></li>
                        <li><?= $p->opsi_d ?></li>
                    </ol>

                <?php else : ?>
                    <ol type="A">
                        <li><?= $p->opsi_a ?></li>
                        <li><?= $p->opsi_b ?></li>
                        <li><?= $p->opsi_c ?></li>
                        <li><?= $p->opsi_d ?></li>
                        <li><?= $p->opsi_e ?></li>
                    </ol>

                <?php endif; ?>
                <!-- <h6><strong>Pembahasan</strong></h6> -->
                <p>
                    <a class="btn btn-primary" data-toggle="collapse" href="<?= '#a' . ($p->id_soal) ?>" role="button" aria-expanded="false" aria-controls="<?= 'a' . ($p->id_soal) ?>">
                        Pembahasan
                    </a>
                </p>
                <div class="collapse" id="<?= 'a' . ($p->id_soal) ?>">
                    <div class="card card-body">

                        <?php if( ($p->poin_a || $p->poin_b || $p->poin_c || $p->poin_d || $p->poin_e ) != null ) : ?>
                            <ol type="A">
                                <li><?= " Skor : ". $p->poin_a ?></li>
                                <li><?= " Skor : ". $p->poin_b ?></li>
                                <li><?= " Skor : ". $p->poin_c ?></li>
                                <li><?= " Skor : ". $p->poin_d ?></li>
                                <li><?= " Skor : ". $p->poin_e ?></li>
                            </ol>
                        <?php else : ?>
                            <strong>Jawaban : <?= ($p->jawaban) ?></strong>
                            <p><?= $p->pembahasan ?></p>                           
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>

<?php endforeach; ?>
<?php echo $this->pagination->create_links(); ?>