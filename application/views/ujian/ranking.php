<!-- <h2> Real time ranking sedang dalam perbaikan, ranking nasional akan diumumkan di Instagram @ambiseducation setelah tryout berakhir</h2> -->
<div class="box">
    <div class="box-header with-border">
        <h3 class="box-title"><?=$subjudul?></h3>
        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
        </div>
    </div>
    <div class="table-responsive px-4 pb-3" style="border: 0">
        <table id="detail_hasil" class="w-100 table table-striped table-bordered table-hover">
        <thead>
            <tr>
                <th>No.</th>
                <th>Nama</th>
                <th>TPA</th>
                <th>TBI</th>
                <th>TWK</th>
                <th>TIU</th>
                <th>TKP</th>
                <th>TOTAL TPA TBI</th>
                <th>TOTAL SKD</th>
            </tr>        
        </thead>
        <tfoot>
            <tr>
                <th>No.</th>
                <th>Nama</th>
                <th>TPA</th>
                <th>TBI</th>
                <th>TWK</th>
                <th>TIU</th>
                <th>TKP</th>
                <th>TOTAL TPA TBI</th>
                <th>TOTAL SKD</th>
            </tr>
        </tfoot>
        </table>
    </div>
</div>

<script type="text/javascript">
    var id = '<?=$this->uri->segment(3)?>';
</script>

<script src="<?=base_url()?>assets/dist/js/app/ujian/ranking.js"></script>