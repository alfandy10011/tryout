<div class="container animated fadeIn fast">
    <h2 class="text-center">Evaluasi Hasil</h2>
    <h3 class="text-center">Nama : 
    <?php  

                if(empty($hasil->nama)){
                    echo "Kerjakan Tryout Terlebih Dahulu";
                } else {
                    echo $hasil->nama;
                }
            
            ?>
    </h3>
    <table class="table table-striped">
        <tr>
            <td>Tes Potensi Akademik </td>
            <td><?php  

                if(empty($hasil->nilai_tpa)){
                    echo "Kosong";
                } else {
                    echo $hasil->nilai_tpa;
                }
            
            ?></td>
        </tr>
        <tr>
            <td>Tes Bahasa Inggris </td>
            <td><?php  

            if(empty($hasil->nilai_tbi)){
                echo "Kosong";
            } else {
                echo $hasil->nilai_tbi;
            }

            ?></td>
        </tr>
        <tr>
            <td>Tes Wawasan Kebangsaan </td>
            <td><?php  

            if(empty($hasil->nilai_twk)){
                echo "Kosong";
            } else {
                echo $hasil->nilai_twk;
            }

            ?></td>
        </tr>
        <tr>
            <td>Tes Intelegensia Umum </td>
            <td><?php  

            if(empty($hasil->nilai_tiu)){
                echo "Kosong";
            } else {
                echo $hasil->nilai_tiu;
            }

            ?></td>
        </tr>
        <tr>
            <td>Tes Karakteristik Pribadi </td>
            <td><?php  

            if(empty($hasil->nilai_tkp)){
                echo "Kosong";
            } else {
                echo $hasil->nilai_tkp;
            }

            ?></td>
        </tr>
        <tr>
            <td>Total Nilai TPA dan TBI </td>
            <td>
            <?php  

                if(empty($hasil->nilai_tpa) &&  empty($hasil->nilai_tbi)){
                    echo "Kosong";
                } else {
                    echo $hasil->nilai_tpa + $hasil->nilai_tbi;
                }

                ?>
            </td>
        </tr>
        <tr>
            <td>Total SKD </td>
            <td><?php

                if(empty($hasil->nilai_twk) && empty($hasil->nilai_tiu) && empty($hasil->nilai_tkp)){
                    echo "Kosong";
                } else {
                    echo $hasil->nilai_twk + $hasil->nilai_tiu + $hasil->nilai_tkp;
                }
            
            ?></td>
        </tr>
        <tr>
            <td>Status</td>
            <td> 
                <?php

                    if( empty($hasil->nilai_tpa) &&  empty($hasil->nilai_tbi) && empty($hasil->nilai_twk) && empty($hasil->nilai_tiu) && empty($hasil->nilai_tkp) ){
                        echo "Kosong";
                    }else{
                        if($hasil->nilai_tpa >= 67 && $hasil->nilai_tbi>= 30 && $hasil->nilai_twk>= 75 && $hasil->nilai_tiu >= 80 && $hasil->nilai_tkp >= 143){
                            echo "<strong>LULUS Ambang Batas</strong>";
                        }else{
                            echo "<stron>TIDAK LULUS Ambang Batas</strong>";
                        }
                    }


                ?>
            </td>
        </tr>
        <tr>
            <td>Prediksi Pilihan 1</td>
            <td><?= $get_nama1; ?> 
                </br>
                <?php

                    if( empty($hasil->nilai_tpa) &&  empty($hasil->nilai_tbi) && empty($hasil->nilai_twk) && empty($hasil->nilai_tiu) && empty($hasil->nilai_tkp) ){
                        echo "Kosong";
                    }else{
                        if( ($hasil->nilai_tpa + $hasil->nilai_tbi) >=  $cek_pg_1 && $hasil->nilai_tpa >= 67 && $hasil->nilai_tbi>= 30 && $hasil->nilai_twk>= 75 && $hasil->nilai_tiu >= 80 && $hasil->nilai_tkp >= 143){
                            echo "<strong>LULUS</strong>";
                        }else{
                            echo "<stron>BELUM LULUS</strong>";
                        }
                    }        

                ?>
            </td>
        </tr>
        <tr>
            <td>Prediksi Pilihan 2</td>
            <td><?= $get_nama2; ?>
            </br>
            <?php

            if( empty($hasil->nilai_tpa) &&  empty($hasil->nilai_tbi) && empty($hasil->nilai_twk) && empty($hasil->nilai_tiu) && empty($hasil->nilai_tkp) ){
                echo "Kosong";
            }else{
                if( ($hasil->nilai_tpa + $hasil->nilai_tbi) >=  $cek_pg_2 && $hasil->nilai_tpa >= 67 && $hasil->nilai_tbi>= 30 && $hasil->nilai_twk>= 75 && $hasil->nilai_tiu >= 80 && $hasil->nilai_tkp >= 143){
                    echo "<strong>LULUS</strong>";
                }else{
                    echo "<stron>BELUM LULUS</strong>";
                }
            }        

            ?>
            </td>
        </tr>
        <tr>
            <td>Prediksi Pilihan 3</td>
            <td><?= $get_nama3; ?>
            </br>
            <?php

            if( empty($hasil->nilai_tpa) &&  empty($hasil->nilai_tbi) && empty($hasil->nilai_twk) && empty($hasil->nilai_tiu) && empty($hasil->nilai_tkp) ){
                echo "Kosong";
            }else{
                if( ($hasil->nilai_tpa + $hasil->nilai_tbi) >=  $cek_pg_2 && $hasil->nilai_tpa >= 67 && $hasil->nilai_tbi>= 30 && $hasil->nilai_twk>= 75 && $hasil->nilai_tiu >= 80 && $hasil->nilai_tkp >= 143){
                    echo "<strong>LULUS</strong>";
                }else{
                    echo "<stron>BELUM LULUS</strong>";
                }
            }        

            ?>
            </td>
        </tr>
    </table>
</div>
