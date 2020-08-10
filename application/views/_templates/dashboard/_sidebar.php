<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <?php 
			$page = $this->uri->segment(1);
			$master = ["seleksi", "kelas", "mataujian", "dosen", "member"];
			$relasi = ["kelasdosen", "seleksimataujian"];
			$users = ["users"];
			?>

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<?=base_url('dashboard')?>">
        <div class="sidebar-brand-text mx-3">Siap Tryout</div>
      </a>
      

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="<?=base_url('dashboard')?>">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Beranda</span></a>
      </li>

      <?php if($this->ion_auth->is_admin()) : ?>
      <hr class="sidebar-divider">
      <?php endif; ?>

      <?php if($this->ion_auth->is_admin()) : ?>
      <div class="sidebar-heading">
        Data Master
      </div>
      <?php endif; ?>


      <?php if($this->ion_auth->is_admin()) : ?>

      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#master" aria-expanded="true" aria-controls="master">
          <i class="fas fa-fw fa-wrench"></i>
          <span>Master</span>
        </a>
        <div id="master" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Data Master:</h6>
            <a class="collapse-item" href="<?=base_url('seleksi')?>">Seleksi</a>
            <a class="collapse-item" href="<?=base_url('kelas')?>">Ujian Seleksi</a>
            <a class="collapse-item" href="<?=base_url('mataujian')?>">Mata Ujian</a>
            <a class="collapse-item" href="<?=base_url('dosen')?>">Judul Tryout</a>
            <a class="collapse-item" href="<?=base_url('member')?>">Member</a>
          </div>
        </div>
      </li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#relasi" aria-expanded="true" aria-controls="relasi">
          <i class="fas fa-fw fa-wrench"></i>
          <span>Relasi</span>
        </a>
        <div id="relasi" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Relasi:</h6>
            <a class="collapse-item" href="<?=base_url('kelasdosen')?>">Ujian Seleksi - Judul Tryout</a>
            <a class="collapse-item" href="<?=base_url('seleksimataujian')?>">Seleksi - Mata Ujian</a>
          </div>
        </div>
      </li>
      <?php endif; ?>


      <!-- Pembatas -->
      <hr class="sidebar-divider">
      <?php if($this->ion_auth->is_admin() || $this->ion_auth->in_group('dosen') ) : ?>
        <li class="nav-item">
        <a class="nav-link" href="<?=base_url('soal')?>">
          <i class="fas fa-fw fa-pen"></i>
          <span>Bank Soal</span></a>
      </li>
      <?php endif; ?>

      <?php if($this->ion_auth->is_admin() || $this->ion_auth->in_group('dosen') ) : ?>
        <li class="nav-item">
        <a class="nav-link" href="<?=base_url('soal/tryout')?>">
          <i class="fas fa-fw fa-pen"></i>
          <span>Buat Tryout </span></a>
      </li>
      <?php endif; ?>

      <?php if($this->ion_auth->is_admin() || $this->ion_auth->in_group('dosen') ) : ?>
        <li class="nav-item">
        <a class="nav-link" href="<?=base_url('suplemen')?>">
          <i class="fas fa-fw fa-book"></i>
          <span>Master E-Book </span></a>
      </li>
      <?php endif; ?>

      <?php if($this->ion_auth->in_group('dosen') ) : ?>
        <li class="nav-item">
        <a class="nav-link" href="<?=base_url('ujian/master')?>">
          <i class="fas fa-fw fa-pen"></i>
          <span>Tryout Online</span></a>
      </li>
      <?php endif; ?>


      <!-- Menu 2 -->

      <!-- Heading  Tryout-->
      <?php if( $this->ion_auth->in_group('member') ) : ?>
      <div class="sidebar-heading">
        Tryout
      </div>
      <?php endif; ?>
      <!-- Nav Item - Tryout -->
      <?php if( $this->ion_auth->in_group('member') ) : ?>
      <li class="nav-item">
        <a class="nav-link" href="<?=base_url('ujian/daftar_to')?>">
          <i class="fas fa-fw fa-pen"></i>
          <span>Tryout Online</span></a>
      </li>
      <?php endif; ?>
      <!-- Nav Item - Tables -->
      <?php if( $this->ion_auth->in_group('member') ) : ?>
      <li class="nav-item">
        <a class="nav-link" href="<?=base_url('hasilujian/daftar_ranking/')?>">
          <i class="fas fa-fw fa-table"></i>
          <span>Ranking Nasional</span></a>
      </li>
      <?php endif; ?>

      <!-- Divider -->
      <hr class="sidebar-divider">
      <?php if( $this->ion_auth->in_group('member') ) : ?>
      <div class="sidebar-heading">
        Suplemen
      </div>
      <?php endif; ?>

      <?php if( $this->ion_auth->in_group('member') ) : ?>
      <li class="nav-item">
        <a class="nav-link" href="<?=base_url('utilities/ebook')?>">
          <i class="fas fa-fw fa-book"></i>
          <span>E-Book</span></a>
      </li>
      <?php endif; ?>

      <hr class="sidebar-divider">

      <!-- Menu 4 -->

      <!-- Heading -->
      <?php if( $this->ion_auth->in_group('member') ) : ?>
      <div class="sidebar-heading">
        LAINNYA
      </div>
      <?php endif; ?>
      <!-- Nav Item - Charts -->
      <?php if( $this->ion_auth->in_group('member') ) : ?>
      <li class="nav-item">
        <a class="nav-link" href="<?=base_url('utilities/panduan')?>">
          <i class="fas fa-fw fa-question"></i>
          <span>Panduan</span></a>
      </li>
      <?php endif; ?>

      <?php if( $this->ion_auth->in_group('member') ) : ?>
      <li class="nav-item">
        <a class="nav-link" href="<?=base_url('utilities/contact')?>">
          <i class="fas fa-fw fa-address-book"></i>
          <span>Kritik & Masukan</span></a>
      </li>
      <?php endif; ?>

      <?php if( $this->ion_auth->in_group('member') ) : ?>
      <li class="nav-item">
        <a class="nav-link" href="<?=base_url('profil')?>">
          <i class="fas fa-fw fa-user"></i>
          <span>Profil</span></a>
      </li>
      <?php endif; ?>

      <?php if( $this->ion_auth->is_admin() ) : ?>
      <div class="sidebar-heading">
        Pengaturan
      </div>
      <?php endif; ?>

      <?php if( $this->ion_auth->is_admin() ) : ?>
      <li class="nav-item">
        <a class="nav-link" href="<?=base_url('users')?>">
          <i class="fas fa-fw fa-book"></i>
          <span>Manajemen User</span></a>
      </li>
      <?php endif; ?>

      <?php if( $this->ion_auth->is_admin() ) : ?>
      <li class="nav-item">
        <a class="nav-link" href="<?=base_url('settings')?>">
          <i class="fas fa-fw fa-book"></i>
          <span>Settings</span></a>
      </li>
      <?php endif; ?>

      <!-- Nav Item - Tables -->
      <!-- <li class="nav-item">
        <a class="nav-link" href="tables.html">
          <i class="fas fa-fw fa-table"></i>
          <span>Tables</span></a>
      </li> -->

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>