import 'package:flutter/material.dart';
import '../main.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';
import 'edit_profile_page.dart';
import 'about_page.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile _profile = const Profile(
    nama: 'Muhammad Ubaydillah',
    nim: '1124160011',
    prodi: 'Teknik Informatika',
    kelas: 'A',
    bio: 'Mahasiswa yang suka belajar pemrograman mobile.',
    email: 'ubay@email.com',
    hp: '081234567890',
    github: 'github.com/usernamekamu',
  );

  Future<void> _edit() async {
    final result = await Navigator.push<Profile>(
      context,
      MaterialPageRoute(builder: (_) => EditProfilePage(profile: _profile)),
    );
    if (result != null) {
      setState(() => _profile = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        actions: [
          IconButton(
            tooltip: 'Mode gelap',
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              themeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(_profile.nama,
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Keluar'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _edit,
        icon: const Icon(Icons.edit),
        label: const Text('Edit'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Center(
            child: CircleAvatar(
              radius: 64,
              backgroundImage: AssetImage('assets/images/foto.jpg'),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(_profile.nama,
                style: Theme.of(context).textTheme.headlineSmall),
          ),
          Center(child: Text('${_profile.nim} • ${_profile.prodi} • Kelas ${_profile.kelas}')),
          const SizedBox(height: 12),
          Text(_profile.bio, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          InfoTile(icon: Icons.email, title: 'Email', value: _profile.email),
          InfoTile(icon: Icons.phone, title: 'No. HP', value: _profile.hp),
          InfoTile(icon: Icons.code, title: 'GitHub', value: _profile.github),
        ],
      ),
    );
  }
}