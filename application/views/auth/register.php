<img class="wave" src="../assets/dist/img/wave.png">
<div class="container">
  <div class="img">
    <img src="../assets/dist/img/bg.svg">
  </div>
  <div class="login-content">
    <?= form_open("auth/post_register", array('id' => 'submit')); ?>
    <img src="../assets/dist/img/avatar.svg">
    <h2 class="animated bounceInDown title">Daftar Siap Tryout</h2>
    <div class="input-div one">
      <div class="i">
        <i class="fas fa-user"></i>
      </div>
      <div class="div">
        <h5>Username</h5>
        <input type="text" class="input" name="username">
      </div>
    </div>
    <div class="input-div one">
      <div class="i">
        <i class="fas fa-user"></i>
      </div>
      <div class="div">
        <h5>Nama Lengkap</h5>
        <input type="text" class="input" name="fullname">
      </div>
    </div>
    <div class="input-div one">
      <div class="i">
        <i class="fas fa-school"></i>
      </div>
      <div class="div">
        <h5>Asal Sekolah</h5>
        <input type="text" class="input" name="school">
      </div>
    </div>
    <div class="input-div one">
      <div class="i">
        <i class="fas fa-envelope"></i>
      </div>
      <div class="div">
        <h5>Email</h5>
        <input type="email" class="input" name="email">
      </div>
    </div>
    <div class="input-div pass">
      <div class="i">
        <i class="fas fa-lock"></i>
      </div>
      <div class="div">
        <h5>Kata Sandi</h5>
        <input type="password" class="input" name="password">
      </div>
    </div>
    <div class="input-div pass">
      <div class="i">
        <i class="fas fa-lock"></i>
      </div>
      <div class="div">
        <h5>Konfirmasi Kata Sandi</h5>
        <input type="password" class="input" name="password_confirmation">
      </div>
    </div>
    <?= form_submit('submit', 'Daftar', array('id' => 'register_submit', 'class' => 'btn btn-primary btn-block btn-flat')); ?>
    <?= form_close(); ?>
  </div>
</div>
