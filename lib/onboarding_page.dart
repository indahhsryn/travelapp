import 'package:flutter/material.dart';
import 'main.dart'; // untuk akses LoginPage dari main.dart

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/onboard1.png",
      "title": "Buat rencana perjalananmu",
      "desc": "Rancang liburan ke Jogja dengan lebih mudah dan menyenangkan."
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
      body: PageView.builder(
        controller: _controller,
        itemCount: onboardingData.length,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        itemBuilder: (context, index) {
          final data = onboardingData[index];
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(data['image']!, height: 280),
                const SizedBox(height: 32),
                Text(
                  data['title']!,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  data['desc']!,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (index == onboardingData.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      );
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
