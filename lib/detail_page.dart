// Mengimpor pustaka UI Flutter
import 'package:flutter/material.dart';

// Mengimpor halaman TripSchedule untuk navigasi ketika menambahkan ke daftar liburan
import 'trip_schedule_page.dart';

// Mengimpor halaman HomePage dari main.dart untuk navigasi ke halaman utama
import 'main.dart';

// ------------------ DETAIL PAGE ------------------

// Widget Stateless (karena data tidak berubah), menampilkan detail tempat wisata
class DetailPage extends StatelessWidget {
  // Properti yang dibutuhkan untuk menampilkan informasi tempat wisata
  final String name; // Nama tempat
  final String location; // Lokasi (belum digunakan di UI)
  final String image; // Path gambar
  final String description; // Deskripsi

  // Konstruktor dengan parameter wajib
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
      // Stack digunakan untuk menumpuk widget: gambar latar belakang dan konten
      body: Stack(
        children: [
          // Gambar latar belakang yang menutupi seluruh layar
          Image.asset(
            image,
            width: double.infinity, // Lebar layar penuh
            height: double.infinity, // Tinggi layar penuh
            fit: BoxFit.cover, // Menyesuaikan gambar agar menutupi layar
          ),

          // Konten utama ditampilkan di bagian bawah layar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16), // Padding isi konten
              decoration: BoxDecoration(
                // Efek gradasi dari transparan ke hitam agar teks lebih terbaca
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Posisi kiri
                mainAxisSize: MainAxisSize.min, // Menyesuaikan tinggi dengan isi
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
                  const SizedBox(height: 8),

                  // Menampilkan deskripsi wisata
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Baris bintang untuk rating tempat wisata
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const Icon(Icons.star_half, color: Colors.amber, size: 20),
                      const SizedBox(width: 8),
                      const Text(
                        '4.5 (1.2k reviews)', // Teks ulasan
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Baris tombol aksi
                  Row(
                    children: [
                      // Tombol "Masukan List Liburan"
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigasi ke halaman TripSchedulePage dengan data nama dan gambar tempat
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
                            backgroundColor: Colors.transparent, // Transparan
                            side: const BorderSide(color: Colors.white), // Border putih
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20), // Sudut membulat
                            ),
                          ),
                          child: const Text('Masukan List Liburan'),
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Tombol "Lihat Lainnya" untuk kembali ke halaman utama (HomePage)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigasi ke halaman HomePage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Background putih
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text('Lihat Lainnya'),
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
