import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xylophone',
      theme: ThemeData(useMaterial3: true),
      home: const XylophonePage(),
    );
  }
}

class XylophonePage extends StatelessWidget {
  const XylophonePage({super.key});

  Future<void> _playSound(int soundNumber) async {
    final player = AudioPlayer();

    await player.play(AssetSource('note$soundNumber.wav'));
  }

  Widget _buildKey({
    required Color color,
    required int soundNumber,
    required String note,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              _playSound(soundNumber);
            },
            child: Center(
              child: Text(
                note,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Xylophone',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildKey(color: Colors.red, soundNumber: 1, note: 'DO'),
              _buildKey(color: Colors.orange, soundNumber: 2, note: 'RE'),
              _buildKey(
                color: Colors.yellow.shade700,
                soundNumber: 3,
                note: 'MI',
              ),
              _buildKey(color: Colors.green, soundNumber: 4, note: 'FA'),
              _buildKey(color: Colors.teal, soundNumber: 5, note: 'SOL'),
              _buildKey(color: Colors.blue, soundNumber: 6, note: 'LA'),
              _buildKey(color: Colors.purple, soundNumber: 7, note: 'SI'),
            ],
          ),
        ),
      ),
    );
  }
}
