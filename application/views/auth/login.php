<img class="wave" src="assets/dist/img/wave.png">
<div class="container">
  <div class="img">
    <img src="assets/dist/img/bg.svg">
  </div>
  <div class="login-content">
    <?= form_open("auth/cek_login", array('id' => 'login')); ?>
    <img src="assets/dist/img/avatar.svg">
    <h2 class="animated bounceInDown title">Siap Tryout</h2>
    <div class="input-div one">
      <div class="i">
        <i class="fas fa-envelope"></i>
      </div>
      <div class="div">
        <?= form_input($identity); ?>
        <!-- <h5>Email</h5>
           		   		<input type="text" class="input"> -->
      </div>
    </div>
    <div class="input-div pass">
      <div class="i">
        <i class="fas fa-lock"></i>
      </div>
      <div class="div">
        <?= form_input($password); ?>
        <!-- <h5>Kata Sandi</h5>
           		    	<input type="password" class="input"> -->
      </div>
    </div>
    <a href='<?php echo site_url('auth/register') ?>'>Daftar</a>
    <a href="#">Lupa Kata Sandi?</a>
    <?= form_submit('submit', lang('login_submit_btn'), array('id' => 'submit', 'class' => 'btn btn-primary btn-block btn-flat')); ?>
    <?= form_close(); ?>
  </div>
</div>

<script type="text/javascript">
  let base_url = '<?= base_url(); ?>';
</script>
<script src="<?= base_url() ?>assets/dist/js/app/auth/login.js"></script>
