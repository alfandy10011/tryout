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
    <h2 class="text-center">Ranking Nasional</h2>
    <div class="box-body  text-center">
        <h4><a href="<?=base_url('hasilujian/ranking/'.$sub_value)?>" class="btn btn-primary" name="tryout" id="tryout" value="<?=$sub_value;?>">Lihat Ranking</a></h4>
    </div>
    <div class="box-body">
    
    </div>
    <!-- <div class="box-footer text-center">
        <a class="btn btn-primary" href="#">Lihat Hasil</a>
    </div> -->
    </div>
</div>

<?php endforeach; ?>
<?php endforeach; ?>