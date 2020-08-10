<div class="row">

<?php foreach($list as $l) : ?>


  <div class="col-sm-3 mx-2">
    <div class="card animated fadeIn fast" style="width: 18rem; height: 14rem;">
      <div class="card-body">
        <h5 class="card-title"><?= $l->nama ?></h5>
        <p class="card-text"><?= $l->deskripsi ?></p>
      </div>
      <div class="card-footer text-center">
        <a href="<?= prep_url($l->link) ?>" target="_blank" class="btn btn-primary">Download</a>
      </div>
    </div>
  </div>  

<?php endforeach ?>

</div>