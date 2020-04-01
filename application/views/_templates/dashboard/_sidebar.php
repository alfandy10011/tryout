<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">

	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">

		<!-- Sidebar user panel (optional) -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="<?=base_url()?>assets/dist/img/user1.png" class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p><?=$user->username?></p>
				<small><?=$user->email?></small>
			</div>
		</div>
		
		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">MAIN MENU</li>
			<!-- Optionally, you can add icons to the links -->
			<?php 
			$page = $this->uri->segment(1);
			$master = ["jurusan", "kelas", "matkul", "dosen", "mahasiswa"];
			$relasi = ["kelasdosen", "jurusanmatkul"];
			$users = ["users"];
			?>
			<li class="<?= $page === 'dashboard' ? "active" : "" ?>"><a href="<?=base_url('dashboard')?>"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
			<?php if($this->ion_auth->is_admin()) : ?>
			<li class="treeview <?= in_array($page, $master)  ? "active menu-open" : ""  ?>">
				<a href="#"><i class="fa fa-folder"></i> <span>Data Master</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">
					<li class="<?=$page==='jurusan'?"active":""?>">
						<a href="<?=base_url('jurusan')?>">
							<i class="fa fa-circle-o"></i> 
							Master Fitur
						</a>
					</li>
					<li class="<?=$page==='kelas'?"active":""?>">
						<a href="<?=base_url('kelas')?>">
							<i class="fa fa-circle-o"></i>
							Master Ujian Seleksi
						</a>
					</li>
					<li class="<?=$page==='matkul'?"active":""?>">
						<a href="<?=base_url('matkul')?>">
							<i class="fa fa-circle-o"></i>
							Master Mata Ujian
						</a>
					</li>
					<li class="<?=$page==='dosen'?"active":""?>">
						<a href="<?=base_url('dosen')?>">
							<i class="fa fa-circle-o"></i>
							Master Judul Tryout
						</a>
					</li>
					<li class="<?=$page==='mahasiswa'?"active":""?>">
						<a href="<?=base_url('mahasiswa')?>">
							<i class="fa fa-circle-o"></i>
							Master Member
						</a>
					</li>
				</ul>
			</li>
			<li class="treeview <?= in_array($page, $relasi)  ? "active menu-open" : ""  ?>">
				<a href="#"><i class="fa fa-link"></i> <span>Relasi</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">
					<li class="<?=$page==='kelasdosen'?"active":""?>">
						<a href="<?=base_url('kelasdosen')?>">
							<i class="fa fa-circle-o"></i>
							Ujian Seleksi - Judul Tryout
						</a>
					</li>
					<li class="<?=$page==='jurusanmatkul'?"active":""?>">
						<a href="<?=base_url('jurusanmatkul')?>">
							<i class="fa fa-circle-o"></i>
							Fitur - Mata Ujian
						</a>
					</li>
				</ul>
			</li>
			<?php endif; ?>
			<?php if( $this->ion_auth->is_admin() || $this->ion_auth->in_group('dosen') ) : ?>
			<li class="<?=$page==='soal'?"active":""?>">
				<a href="<?=base_url('soal')?>" rel="noopener noreferrer">
					<i class="fa fa-file-text-o"></i> <span>Bank Soal</span>
				</a>
			</li>
			<?php endif; ?>
			<?php if( $this->ion_auth->is_admin() || $this->ion_auth->in_group('dosen') ) : ?>
			<li class="<?=$page==='soal/tryout'?"active":""?>">
				<a href="<?=base_url('soal/tryout')?>" rel="noopener noreferrer">
					<i class="fa fa-file-text-o"></i> <span>Tryout</span>
				</a>
			</li>
			<?php endif; ?>
			<?php if( $this->ion_auth->in_group('dosen') ) : ?>
			<li class="<?=$page==='ujian'?"active":""?>">
				<a href="<?=base_url('ujian/master')?>" rel="noopener noreferrer">
					<i class="fa fa-chrome"></i> <span>Tryout Online</span>
				</a>
			</li>
			<?php endif; ?>
			<?php if( $this->ion_auth->in_group('mahasiswa') ) : ?>
			<li class="header">TRYOUT</li>
			<li class="<?=$page===''?"active":""?>">
				<a href="<?=base_url('ujian/daftar_to')?>" rel="noopener noreferrer">
					<i class="fa fa-chrome"></i> <span>Tryout Online</span>
				</a>
			</li>
			</li>
			<?php endif; ?>
			<!-- <?php if( $this->ion_auth->in_group('mahasiswa') ) : ?>
			<li class="<?=$page===''?"active":""?>">
				<a href="<?=base_url('ujian/lihat_hasil/4')?>" rel="noopener noreferrer">
					<i class="fa fa-chrome"></i> <span>Hasil Tryout</span>
				</a>
			</li>
			</li>
			<?php endif; ?> -->
			<?php if( $this->ion_auth->in_group('mahasiswa') ) : ?>
			<li class="<?=$page===''?"active":""?>">
				<a href="<?=base_url('hasilujian/daftar_ranking/')?>" rel="noopener noreferrer">
					<i class="fa fa-chrome"></i> <span>Ranking Nasional</span>
				</a>
			</li>
			<?php endif; ?>
			<!-- <?php if( $this->ion_auth->in_group('mahasiswa') ) : ?>
			<li class="header">TOKO</li>
			<li class="<?=$page==='toko'?"active":""?>">
				<a href="<?=base_url('toko/paket')?>" rel="noopener noreferrer">
					<i class="fa fa-chrome"></i> <span>Paket Tryout</span>
				</a>
			</li>
			<?php endif; ?> -->
			<!-- <?php if( $this->ion_auth->in_group('mahasiswa') ) : ?>
			<li class="<?=$page===''?"active":""?>">
				<a href="<?=base_url('#')?>" rel="noopener noreferrer">
					<i class="fa fa-chrome"></i> <span>Buku</span>
				</a>
			</li>
			<?php endif; ?> -->
			<?php if( $this->ion_auth->in_group('mahasiswa') ) : ?>
			<li class="header">LAINNYA</li>
			<li class="<?=$page==='utilities/panduan'?"active":""?>">
				<a href="<?=base_url('utilities/panduan')?>" rel="noopener noreferrer">
					<i class="fa fa-chrome"></i> <span>Panduan Tryout</span>
				</a>
			</li>
			<?php endif; ?>
			<!-- <?php if( $this->ion_auth->in_group('mahasiswa') ) : ?>
			<li class="<?=$page==='utilities/faq'?"active":""?>">
				<a href="<?=base_url('utilities/faq')?>" rel="noopener noreferrer">
					<i class="fa fa-chrome"></i> <span>FAQ</span>
				</a>
			</li>
			<?php endif; ?>
			<?php if( $this->ion_auth->in_group('mahasiswa') ) : ?>
			<li class="<?=$page===''?"active":""?>">
				<a href="<?=base_url('utilities/bantuan')?>" rel="noopener noreferrer">
					<i class="fa fa-chrome"></i> <span>Bantuan</span>
				</a>
			</li>
			<?php endif; ?> -->
			<?php if( !$this->ion_auth->in_group('mahasiswa') ) : ?>
			<li class="header">REPORTS</li>
			<li class="<?=$page==='hasilujian'?"active":""?>">
				<a href="<?=base_url('hasilujian')?>" rel="noopener noreferrer">
					<i class="fa fa-file"></i> <span>Hasil Tryout</span>
				</a>
			</li>
			<?php endif; ?>

			<?php if($this->ion_auth->is_admin()) : ?>
			<li class="header">ADMINISTRATOR</li>
			<li class="<?=$page==='users'?"active":""?>">
				<a href="<?=base_url('users')?>" rel="noopener noreferrer">
					<i class="fa fa-users"></i> <span>User Management</span>
				</a>
			</li>
			<li class="<?=$page==='settings'?"active":""?>">
				<a href="<?=base_url('settings')?>" rel="noopener noreferrer">
					<i class="fa fa-cog"></i> <span>Settings</span>
				</a>
			</li>
			<?php endif; ?>
		</ul>

	</section>
	<!-- /.sidebar -->
</aside>