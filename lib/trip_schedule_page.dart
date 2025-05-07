import 'package:flutter/material.dart';

// Halaman penjadwalan perjalanan (Trip Schedule)
// Menerima dua parameter dari halaman sebelumnya:
// - destinationName: nama tempat wisata
// - destinationImage: gambar tempat wisata
class TripSchedulePage extends StatelessWidget {
  final String destinationName;
  final String destinationImage;

  const TripSchedulePage({
    super.key,
    required this.destinationName,
    required this.destinationImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar di bagian atas halaman
      appBar: AppBar(
        title: const Text('New Plan'), // Judul halaman
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Tombol kembali
          onPressed: () => Navigator.pop(context), // Navigasi ke halaman sebelumnya
        ),
      ),

      // Konten utama halaman
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri semua elemen
        children: [
          // Menampilkan gambar destinasi yang dipilih
          ClipRRect(
            borderRadius: BorderRadius.circular(12), // Membuat sudut gambar membulat
            child: Image.asset(
              destinationImage, // Gambar dari input
              width: double.infinity, // Lebar gambar sesuai lebar layar
              height: 180, // Tinggi gambar
              fit: BoxFit.cover, // Menyesuaikan gambar agar tidak terdistorsi
            ),
          ),

          // Menampilkan nama destinasi di bawah gambar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              destinationName, // Nama destinasi dari parameter
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Label untuk bagian pemilihan tanggal
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Pilih Tanggal', // Judul bagian
              style: TextStyle(fontSize: 16),
            ),
          ),

          const SizedBox(height: 12), // Jarak antar elemen

          // Bagian utama itinerary ditampilkan dalam ListView agar bisa discroll
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                // Teks penanda hari
                Text(' 1 - July 14'),

                // Jadwal kegiatan hari itu
                ListTile(
                  leading: Icon(Icons.alarm), // Ikon alarm
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
