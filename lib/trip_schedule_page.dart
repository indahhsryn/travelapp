import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text('New Plan'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar tempat wisata yang dipilih
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              destinationImage,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              destinationName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Select dates',
              style: TextStyle(fontSize: 16),
            ),
          ),

          const SizedBox(height: 12),

          // Simulasi konten itinerary
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                Text('Day 1 - July 14'),
                ListTile(
                  leading: Icon(Icons.alarm),
                  title: Text('5:30 - Wake up'),
                ),
                ListTile(
                  leading: Icon(Icons.tour),
                  title: Text('7:30 - City tour'),
                ),
                ListTile(
                  leading: Icon(Icons.restaurant),
                  title: Text('12:00 - Lunch break'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
