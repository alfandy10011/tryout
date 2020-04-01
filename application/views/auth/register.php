<div class="login-box pt-5">
	<!-- /.login-logo -->
	<div class="login-box-body">
	<h3 class="text-center mt-0 mb-4">
		<b>S</b>iap <b>T</b>ryout 
	</h3> 
	<p class="login-box-msg">Pendaftaran Tryout Online SPMB PKN STAN</p>

            <form class="user" method="post" action="<?php base_url('auth/registration') ?>" id="register">
                <div class="form-group">
                  <input type="text" name="username" class="form-control form-control-user" id="username" placeholder="Username" value="<?= set_value('username')?>" > 
                  <?= form_error('username'); ?>
                </div>
                <div class="form-group">
                  <input type="text" name="fname" class="form-control form-control-user" id="fname" placeholder="Nama Lengkap" value="<?= set_value('fname')?>" > 
                  <?= form_error('fname'); ?>
                </div>
                <div class="form-group">
                  <input type="email" name="email" class="form-control form-control-user" id="email" placeholder="Email" value="<?= set_value('email')?>" >
                  <?= form_error('email'); ?>
                </div>
                <div class="form-group">
                    <input  placeholder="Asal Sekolah" type="text" class="form-control" name="asal_sekolah">
                    <?= form_error('asal_sekolah'); ?> 
                    <small class="help-block"></small>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" name="password1" class="form-control form-control-user" id="password1" placeholder="Password"> 
                    <?= form_error('password1'); ?> 
                  </div>
                  <div class="col-sm-6">
                    <input type="password" name="password2" class="form-control form-control-user" id="password2" placeholder="Confirm Password">
                  </div>
                </div>
                <div class="form-group">
                    <label for="nama_lengkap">Pilihan 1</label>
                    <select class="form-control" id="pil_1" name="pil_1">
                    <?php 
                    foreach($profil as $p)
                    { 
                    echo '<option value="'.$p->id_prodi.'">'.$p->nama_prodi.'</option>';
                    }
                    ?>
                    </select>
                    <small class="help-block"></small>
                </div>
                <div class="form-group">
                    <label for="nama_lengkap">Pilihan 1</label>
                    <select class="form-control" id="pil_1" name="pil_2">
                    <?php 
                    foreach($profil as $p)
                    { 
                    echo '<option value="'.$p->id_prodi.'">'.$p->nama_prodi.'</option>';
                    }
                    ?>
                    </select>
                    <small class="help-block"></small>
                </div>
                <div class="form-group">
                    <label for="nama_lengkap">Pilihan 1</label>
                    <select class="form-control" id="pil_1" name="pil_3">
                    <?php 
                    foreach($profil as $p)
                    { 
                    echo '<option value="'.$p->id_prodi.'">'.$p->nama_prodi.'</option>';
                    }
                    ?>
                    </select>
                    <small class="help-block"></small>
                </div>
                <button type="submit" class="btn btn-primary btn-user btn-block">
                  Daftar 
                </button>
                <hr>
              </form>
	</div>
</div>


<script type="text/javascript">
	let base_url = '<?=base_url();?>';
</script>
<script src="<?=base_url()?>assets/dist/js/app/auth/register.js"></script>

