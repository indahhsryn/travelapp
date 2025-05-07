// ------------------ IMPORT PACKAGE ------------------
import 'dart:async'; // Untuk penggunaan Timer (menunda aksi)
import 'package:flutter/material.dart'; // Mengimpor Material UI bawaan Flutter
import 'detail_page.dart'; // Mengimpor halaman detail tempat wisata
import 'onboarding_page.dart'; // Mengimpor halaman onboarding

// ------------------ ENTRY POINT ------------------

// Fungsi utama yang dijalankan pertama kali saat aplikasi dimulai
void main() {
  runApp(const TravelApp()); // Menjalankan aplikasi dengan widget TravelApp sebagai root widget
}

// Widget utama dari aplikasi
class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App', // Judul aplikasi
      debugShowCheckedModeBanner: false, // Menghilangkan banner "DEBUG" di pojok kanan atas
      home: const SplashScreen(), // Menampilkan halaman SplashScreen pertama kali
    );
  }
}

// ------------------ SPLASH SCREEN ------------------

// Halaman pembuka yang muncul sesaat sebelum ke onboarding
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState(); // Mengatur state-nya
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Fungsi Timer untuk delay selama 3 detik lalu pindah ke halaman onboarding
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingPage()), // Navigasi ke onboarding
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Warna latar putih
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Tengah vertikal
          children: [
            // Menampilkan logo aplikasi
            Image.asset(
              'assets/images/travel_logo.png',
              width: 200,
            ),
            const SizedBox(height: 20), // Jarak antar elemen secara vertikal
            // Bisa ditambahkan animasi loading di sini (misal: CircularProgressIndicator)
          ],
        ),
      ),
    );
  }
}

// ------------------ LOGIN PAGE ------------------

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold adalah struktur dasar halaman (memuat appbar, body, dll)
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri semua elemen
          children: [
            const Icon(Icons.arrow_back), // Ikon kembali (belum aktif fungsinya)
            const SizedBox(height: 20),

            // Judul halaman login
            const Text(
              'Login',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Field input username
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter username', // Teks placeholder
                prefixIcon: const Icon(Icons.person_outline), // Ikon di awal input
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // Sudut membulat
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(height: 16),

            // Field input password
            TextField(
              obscureText: true, // Menyembunyikan karakter input
              decoration: InputDecoration(
                hintText: 'Enter password',
                prefixIcon: const Icon(Icons.lock_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),

            const SizedBox(height: 24),

            // Tombol login — akan langsung menuju halaman HomePage
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()), // Navigasi ke HomePage
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 13, 54, 123), // Warna biru
                minimumSize: const Size(double.infinity, 50), // Tombol full width
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Membuat tombol membulat
                ),
              ),
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            // Divider horizontal dengan teks "Or"
            Row(
              children: const [
                Expanded(child: Divider(thickness: 1)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Or"),
                ),
                Expanded(child: Divider(thickness: 1)),
              ],
            ),

            const SizedBox(height: 20),

            // Tombol login Google (dummy)
            ElevatedButton.icon(
              onPressed: () {
                // Fitur login Google belum diimplementasikan
              },
              label: const Text("Continue with Google"),
              icon: const Icon(Icons.g_mobiledata_rounded),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------ HOME PAGE ------------------

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Data dummy list tempat wisata di Jogja
  final List<Map<String, String>> wisataJogja = const [
    {
      "name": "Candi Prambanan",
      "location": "15 km dari kota",
      "image": "assets/images/prambanan.jpg",
      "description": "Candi Hindu terbesar di Indonesia dan Situs Warisan Dunia UNESCO.",
    },
    {
      "name": "Pantai Parangtritis",
      "location": "25 km dari kota",
      "image": "assets/images/parangtritis.jpg",
      "description": "Pantai terkenal dengan pemandangan sunset dan ombak besar.",
    },
    {
      "name": "Malioboro",
      "location": "Pusat Kota",
      "image": "assets/images/malioboro.jpg",
      "description": "Pusat oleh-oleh dan jalan ikonik kota Jogja.",
    },
    {
      "name": "Tebing Breksi",
      "location": "18 km dari kota",
      "image": "assets/images/breksi.jpg",
      "description": "Tebing batu artistik dengan ukiran indah dan panorama bagus.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Struktur utama halaman
      backgroundColor: Colors.white,
      body: SafeArea( // Menghindari notch atau area status bar
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Find your next trip',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 8),

              const Text(
                'Wisata Jogja',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              // Kolom pencarian dan tombol filter
              Row(
                children: [
                  // TextField pencarian
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        filled: true,
                        fillColor: Colors.grey[200],
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Tombol filter
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.tune, color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                'Popular locations',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              // GridView untuk menampilkan daftar wisata
              Expanded(
                child: GridView.builder(
                  itemCount: wisataJogja.length, // Jumlah item di daftar
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 kolom dalam satu baris
                    childAspectRatio: 0.85, // Rasio lebar terhadap tinggi item
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final place = wisataJogja[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigasi ke halaman detail ketika item diklik
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailPage(
                              name: place['name']!,
                              location: place['location']!,
                              image: place['image']!,
                              description: place['description']!,
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // Gambar destinasi
                            Image.asset(
                              place['image']!,
                              fit: BoxFit.cover, // Gambar menyesuaikan ukuran container
                            ),
                            // Overlay gradasi hitam transparan untuk teks terlihat jelas
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.3),
                                    Colors.transparent
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                            // Nama dan lokasi di bagian bawah gambar
                            Positioned(
                              bottom: 10,
                              left: 10,
                              right: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    place['name']!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    place['location']!,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
