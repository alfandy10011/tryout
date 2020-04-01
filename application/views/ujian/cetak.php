<p>
Lorem ipsum dolor, sit amet consectetur adipisicing elit. Cumque facere sint veniam.
Dolore distinctio, at consequuntur magnam cupiditate voluptate hic ratione ea illo nulla quis cum optio, nisi eius dignissimos!
</p>
<h2>Data Peserta</h2>
<table id="data-peserta">
    <tr>
        <th>NIM</th>
        <td>{$mhs->nim}</td>
    </tr>
    <tr>
        <th>Nama</th>
        <td>{$mhs->nama}</td>
    </tr>
    <tr>
        <th>Kelas</th>
        <td>{$mhs->nama_kelas}</td>
    </tr>
    <tr>
        <th>Jurusan</th>
        <td>{$mhs->nama_jurusan}</td>
    </tr>
</table>
<h2>Data Ujian</h2>
<table id="data-hasil">
    <tr>
        <th>Mata Kuliah</th>
        <td>{$ujian->nama_matkul}</td>
    </tr>
    <tr>
        <th>Nama Ujian</th>
        <td>{$ujian->nama_ujian}</td>
    </tr>
    <tr>
        <th>Jumlah Soal</th>
        <td>{$ujian->jumlah_soal}</td>
    </tr>
</table>
<h2>Hasil Ujian</h2>
<table>
    <tr>
        <th>Jawab Benar</th>
        <td>{$hasil->jml_benar}</td>
    </tr>
    <tr>
        <th>Nilai</th>
        <td>{$hasil->nilai}</td>
    </tr>
</table>