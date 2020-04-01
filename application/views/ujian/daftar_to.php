<?php
    $jml_to = $tryout;
    echo "</br>";
    // print_r($jml_to);
    foreach($jml_to as $key => $value) : 
        foreach($value as $sub_key => $sub_value) :
            
?>

<div class="col-sm-3">
    <div class="box box-solid box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Tryout Online</h3>
        <div class="box-tools pull-right">
        <!-- Buttons, labels, and many other things can be placed here! -->
        <!-- Here is a label for example -->
        <span class="label label-primary">Tryout <?=$sub_value;?></span>
        </div>
        <!-- /.box-tools -->
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <img src="../assets/dist/img/undraw_researching_22gp.svg" class="img-responsive center-block">
    </div>
    <div class="box-body  text-center">
        <h4><a href="<?=base_url('ujian/list/'.$sub_value)?>" class="btn btn-primary" name="tryout" id="tryout" value="<?=$sub_value;?>">Kerjakan Tryout</a></h4>
        <h4><a href="<?=base_url('hasilujian/evaluasi_hasil/'.$sub_value)?>" class="btn btn-success" name="tryout" id="tryout" value="<?=$sub_value;?>">Evaluasi Hasil</a></h4>
    </div>

    <!-- <div class="box-footer text-center">
        <a class="btn btn-primary" href="#">Lihat Hasil</a>
    </div> -->
    </div>
</div>

<?php endforeach; ?>
<?php endforeach; ?>