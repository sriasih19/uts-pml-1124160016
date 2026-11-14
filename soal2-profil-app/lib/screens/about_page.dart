import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Saya')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text('Keahlian & Hobi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ListTile(leading: Icon(Icons.phone_android), title: Text('Flutter / Dart')),
          ListTile(leading: Icon(Icons.web), title: Text('PHP & Web')),
          ListTile(leading: Icon(Icons.sports_esports), title: Text('Bermain game')),
          Divider(),
          Text('Riwayat Pendidikan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Nama Universitas'),
            subtitle: Text('Teknik Informatika • 2024 - sekarang'),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Nama SMA/SMK'),
            subtitle: Text('2021 - 2024'),
          ),
        ],
      ),
    );
  }
}