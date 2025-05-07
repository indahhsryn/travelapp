import 'package:flutter/material.dart';
import 'trip_schedule_page.dart'; // Ganti dengan path file yang sesuai

class DetailPage extends StatelessWidget {
  // Properti yang digunakan untuk menampilkan detail wisata
  final String name;         // Nama tempat wisata
  final String location;     // Lokasi tempat wisata (belum digunakan di UI)
  final String image;        // Path gambar tempat wisata
  final String description;  // Deskripsi tempat wisata

  const DetailPage({
    super.key,
    required this.name,
    required this.location,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Stack digunakan untuk menumpuk widget: gambar di bawah, konten di atas
      body: Stack(
        children: [
          // Menampilkan gambar background fullscreen
          Image.asset(
            image,
            width: double.infinity,   // Lebar gambar memenuhi layar
            height: double.infinity,  // Tinggi gambar memenuhi layar
            fit: BoxFit.cover,        // Gambar menyesuaikan ukuran tanpa distorsi
          ),

          // Posisi konten di bagian bawah dengan efek gradasi gelap
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16), // Padding dalam kontainer
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  // Gradasi dari transparan ke hitam agar teks lebih terbaca
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
                mainAxisSize: MainAxisSize.min, // Ukuran minimum yang diperlukan
                children: [
                  // Menampilkan nama tempat wisata
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8), // Spasi antar elemen

                  // Menampilkan deskripsi tempat wisata
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.white70, // Warna abu agar lebih lembut
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Menampilkan rating bintang dan jumlah ulasan
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const Icon(Icons.star_half, color: Colors.amber, size: 20),
                      const SizedBox(width: 8),
                      const Text(
                        '4.5 (1.2k reviews)', // Nilai rating dan jumlah ulasan
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Baris tombol aksi: simpan & lihat lainnya
                  Row(
                    children: [
                      // Tombol pertama: menyimpan ke list liburan
                    Expanded(
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TripSchedulePage(
            destinationName: name,
            destinationImage: image,
          ),
        ),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      side: const BorderSide(color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: const Text('Masukan List Liburan'),
  ),
),


                      const SizedBox(width: 12),

                      // Tombol kedua: navigasi ke informasi lainnya
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {}, // Aksi ketika tombol ditekan
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Background putih
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20), // Sudut membulat
                            ),
                          ),
                          child: const Text('Lihat Lainya'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
