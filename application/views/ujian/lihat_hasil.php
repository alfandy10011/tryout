<?php
$skortpa = ($hasil->jml_benar * 4) - $hasil->jml_salah;
$skortbi = ($hasil->jml_benar * 5);
$skortwk = ($hasil->jml_benar * 5);
$skortiu = ($hasil->jml_benar * 5);
$skortkp = ($hasil->nilai_tkp);
$cektpa = "TPA";
$cektbi = "TBI";
$cektwk = "TWK";
$cektiu = "TIU";
$cektkp = "TKP";
$kodeujian = $ujian->nama_dosen;

if((strpos($kodeujian, $cektpa) !== false)){
  echo "<h1> Nilai : {$skortpa} </h1>";
  if($skortpa < 69){
    echo "<h1> STATUS : TIDAK LULUS {$cektpa} AMBANG BATAS 69</h1>";  
  }else{
    echo " <h1> STATUS : LULUS <h1> ";
  }
}else if((strpos($kodeujian, $cektbi) !== false)){
  echo "<h1> Nilai : $skortbi </h1>";
  if($skortbi < 30){
    echo "<h1> STATUS : TIDAK LULUS {$cektbi} AMBANG BATAS 30</h1>";  
  }else{
    echo "<h1> STATUS : LULUS </h1>";
  }
}else if((strpos($kodeujian, $cektwk) !== false)){
  echo "<h1> Nilai : $skortwk </h1>";
  if($skortwk < 75){
    echo "<h1>  STATUS : TIDAK LULUS {$cektwk} AMBANG BATAS 75</h1>";  
  }else{
    echo "<h1>  STATUS : LULUS </h1>";
  }
}else if((strpos($kodeujian, $cektiu) !== false)){
  echo "<h1> Nilai : $skortiu </h1>";
  if($skortiu < 80){
    echo "<h1> STATUS : TIDAK LULUS {$cektiu} AMBANG BATAS 80</h1>";  
  }else{
    echo "<h1> STATUS : LULUS </h1>";
  }
}else if((strpos($kodeujian, $cektkp) !== false)){
  echo "<h1> Nilai : $skortkp </h1>";
  if($skortkp < 143){
    echo "<h1> STATUS : TIDAK LULUS {$cektkp}, AMBANG BATAS 143 </h1>";  
  }else{
    echo "<h1> STATUS : LULUS </h1>";
  }
}
?>