<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h3 class="box-title">Master <?=$subjudul?></h3>
    </div>
    <div class="card-body">
        <div class="mt-2 mb-3">
            <button type="button" onclick="reload_ajax()" class="btn btn-sm btn-primary bg-purple"><i class="fa fa-refresh"></i> Reload</button>
            <div class="float-right">
                <label for="show_me">
                    <input type="checkbox" id="show_me">
                    Tampilkan saya
                </label>
            </div>
        </div>
    </div>
    <div class="table-responsive px-4 pb-3" style="border: 0">
        <table id="users" class="w-100 table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Level</th>
                    <th>Created On</th>
                    <th class="text-center">Status</th>
                    <th class="text-center">Action</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <th>No.</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Level</th>
                    <th>Created On</th>
                    <th class="text-center">Status</th>
                    <th class="text-center">Action</th>
                </tr>
            </tfoot>
        </table>
    </div>
</div>

<script type="text/javascript">
    var user_id = '<?=$user->id?>';
</script>

<script src="<?=base_url()?>assets/dist/js/app/users/data.js"></script>