import 'package:flutter/material.dart';
import 'main.dart'; // Mengimpor halaman LoginPage dari main.dart

// Widget Stateful untuk memperbarui tampilan (state) saat pengguna berpindah halaman onboarding
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  // Controller untuk mengontrol navigasi halaman pada PageView
  final PageController _controller = PageController();

  // Menyimpan indeks halaman onboarding yang sedang aktif
  int _currentIndex = 0;

  // Data untuk setiap halaman onboarding (gambar, judul, dan deskripsi)
  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/onboard1.png", // Gambar ilustrasi onboarding
      "title": "Buat rencana perjalananmu", // Judul halaman onboarding
      "desc": "Rancang liburan ke Jogja dengan lebih mudah dan menyenangkan." // Deskripsi
    },
    {
      "image": "assets/images/onboard2.png",
      "title": "Nikmati keindahan Jogja",
      "desc": "Mulai dari Candi, Pantai, hingga Kuliner legendaris."
    },
    {
      "image": "assets/images/onboard3.png",
      "title": "Eksplorasi tanpa batas",
      "desc": "Jelajahi spot wisata populer dan tersembunyi di Jogja!"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // PageView untuk membuat tampilan swipeable dari halaman onboarding
      body: PageView.builder(
        controller: _controller, // Menghubungkan controller untuk navigasi halaman
        itemCount: onboardingData.length, // Jumlah halaman onboarding
        onPageChanged: (index) => setState(() => _currentIndex = index), // Mengubah indeks halaman saat swipe
        itemBuilder: (context, index) {
          final data = onboardingData[index]; // Ambil data berdasarkan indeks saat ini

          return Padding(
            padding: const EdgeInsets.all(24.0), // Memberi jarak dari tepi layar
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Tengah secara vertikal
              children: [
                // Gambar utama onboarding
                Image.asset(data['image']!, height: 280),
                const SizedBox(height: 32), // Jarak antar elemen

                // Judul onboarding
                Text(
                  data['title']!,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Deskripsi onboarding
                Text(
                  data['desc']!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // Tombol navigasi (next / lanjut ke login)
                ElevatedButton(
                  onPressed: () {
                    // Jika sudah di halaman terakhir, arahkan ke LoginPage
                    if (index == onboardingData.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      );
                    } else {
                      // Jika belum, lanjut ke halaman onboarding berikutnya
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300), // Durasi animasi
                        curve: Curves.easeInOut, // Gaya animasi
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Warna tombol
                    shape: const CircleBorder(), // Bentuk tombol bulat
                    padding: const EdgeInsets.all(20), // Ukuran padding dalam tombol
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white, // Warna ikon panah
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
