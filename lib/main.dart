import 'dart:async';
import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'onboarding_page.dart'; // Tambahkan import ini


// ------------------ ENTRY POINT ------------------

// Fungsi utama untuk menjalankan aplikasi
void main() {
  runApp(const TravelApp());
}

// Widget utama aplikasi
class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      home: const SplashScreen(), // Halaman pertama yang ditampilkan
    );
  }
}

// ------------------ SPLASH SCREEN ------------------


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Timer 3 detik, setelah itu navigasi ke halaman onboarding
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/travel_logo.png',
              width: 200,
            ),
            const SizedBox(height: 20),
            // Tambahkan animasi loading atau teks branding di sini kalau perlu
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.arrow_back), // Tombol kembali (belum berfungsi)
            const SizedBox(height: 20),

            // Judul halaman login
            const Text(
              'Login',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Input untuk username
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter username',
                prefixIcon: const Icon(Icons.person_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(height: 16),

            // Input untuk password
            TextField(
              obscureText: true, // Menyembunyikan teks input
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

            // Tombol login yang akan langsung ke HomePage
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 13, 54, 123),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            // Divider bertuliskan "Or"
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

            // Tombol login dengan Google
            ElevatedButton.icon(
              onPressed: () {
                // Tempat untuk menambahkan integrasi login Google
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

  // Data tempat wisata Jogja
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Teks pengantar
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

              // Kolom pencarian dan filter
              Row(
                children: [
                  // Field pencarian
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
                  // Tombol filter (ikon tune)
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
                  itemCount: wisataJogja.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 kolom
                    childAspectRatio: 0.85,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final place = wisataJogja[index]; // Ambil data tiap item
                    return GestureDetector(
                      onTap: () {
                        // Aksi ketika tempat wisata diklik → ke halaman detail
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
                            // Gambar tempat wisata
                            Image.asset(
                              place['image']!,
                              fit: BoxFit.cover,
                            ),
                            // Efek gradasi agar teks lebih terlihat
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
                            // Teks nama dan lokasi di posisi bawah gambar
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
