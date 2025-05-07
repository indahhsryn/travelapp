// Mengimpor pustaka Material dari Flutter untuk membangun UI
import 'package:flutter/material.dart';

// ------------------ TRIP SCHEDULE PAGE ------------------

// Halaman ini menampilkan detail rencana perjalanan wisata
// Menerima data dari halaman sebelumnya berupa:
// - destinationName: nama tempat tujuan
// - destinationImage: gambar tempat tujuan
class TripSchedulePage extends StatelessWidget {
  // Deklarasi variabel final untuk menyimpan data yang diterima
  final String destinationName;
  final String destinationImage;

  // Konstruktor untuk menerima data melalui parameter
  const TripSchedulePage({
    super.key,
    required this.destinationName,
    required this.destinationImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar adalah bagian atas halaman yang menampilkan judul dan tombol kembali
      appBar: AppBar(
        title: const Text('New Plan'), // Judul halaman di AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Ikon panah untuk kembali
          onPressed: () => Navigator.pop(context), // Aksi kembali ke halaman sebelumnya
        ),
      ),

      // Body adalah isi utama dari halaman
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Menyusun semua elemen ke kiri
        children: [
          // Menampilkan gambar destinasi wisata
          ClipRRect(
            borderRadius: BorderRadius.circular(12), // Membuat sudut gambar melengkung
            child: Image.asset(
              destinationImage, // Mengambil path gambar dari parameter
              width: double.infinity, // Lebar penuh layar
              height: 180, // Tinggi gambar
              fit: BoxFit.cover, // Menyesuaikan gambar agar mengisi area tanpa merusak proporsi
            ),
          ),

          // Menampilkan nama destinasi di bawah gambar
          Padding(
            padding: const EdgeInsets.all(16.0), // Padding sekitar teks
            child: Text(
              destinationName, // Menampilkan nama destinasi
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Label bagian pemilihan tanggal
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16), // Padding kiri-kanan
            child: Text(
              'Pilih Tanggal', // Judul bagian untuk memilih tanggal rencana
              style: TextStyle(fontSize: 16),
            ),
          ),

          const SizedBox(height: 12), // Spasi vertikal antar elemen

          // Daftar jadwal rencana perjalanan yang bisa digulir
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16), // Padding list
              children: const [
                // Menandai hari ke-1 dan tanggal
                Text(' 1 - July 14'),

                // ListTile adalah elemen daftar kegiatan
                ListTile(
                  leading: Icon(Icons.alarm), // Ikon kegiatan
                  title: Text('5:30 - Berangkat'), // Deskripsi kegiatan
                ),
                ListTile(
                  leading: Icon(Icons.tour),
                  title: Text('7:30 - Keliling'),
                ),
                ListTile(
                  leading: Icon(Icons.restaurant),
                  title: Text('12:00 - Istirahat'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
