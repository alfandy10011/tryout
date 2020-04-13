<?php
    $jml_to = $tryout;
    echo "</br>";
    // print_r($jml_to);
    foreach($jml_to as $key => $value) : 
        foreach($value as $sub_key => $sub_value) :
            
?>



<div class="col-sm-3"> 
    <div class="card animated fadeIn fast" style="width: 18rem;">
    <!-- <img class="card-img-top" class="img-fluid" src="assets/dist/img/undraw_winners_ao2o.svg"> -->
      <div class="card-body">
        <h5 class="card-title">Tryout <?=$sub_value;?></h5>
        <p class="card-text">Ranking Nasional</p>
        <div class="box-body  text-center">
            <h4><a href="<?=base_url('hasilujian/ranking/'.$sub_value)?>" class="btn btn-primary" name="tryout" id="tryout" value="<?=$sub_value;?>">Lihat Ranking</a></h4>
        </div>
      </div>
    </div>
</div>

<?php endforeach; ?>
<?php endforeach; ?>