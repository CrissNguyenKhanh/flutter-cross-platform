import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MiCard',
      theme: ThemeData(useMaterial3: true),
      home: const MiCardPage(),
    );
  }
}

class MiCardPage extends StatelessWidget {
  const MiCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1565C0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'MiCard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 65,
                  backgroundImage: AssetImage('images/avatar.jpg'),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Nguyễn Quốc khánh',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                    fontSize: 17,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 20),

                const SizedBox(
                  width: 180,
                  child: Divider(color: Colors.white70, thickness: 1),
                ),

                const SizedBox(height: 20),

                _buildInfoCard(icon: Icons.badge, text: '23IT126'),

                const SizedBox(height: 12),

                _buildInfoCard(
                  icon: Icons.school,
                  text: 'Phát triển ứng dụng di động đa nền tảng',
                ),

                const SizedBox(height: 12),

                _buildInfoCard(icon: Icons.code, text: 'Flutter & Dart'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({required IconData icon, required String text}) {
    return Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF1565C0)),
        title: Text(
          text,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
