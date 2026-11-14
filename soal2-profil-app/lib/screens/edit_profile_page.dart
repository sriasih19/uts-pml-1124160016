import 'package:flutter/material.dart';
import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profile;
  const EditProfilePage({super.key, required this.profile});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nama, _nim, _prodi, _kelas, _bio, _email, _hp, _github;

  @override
  void initState() {
    super.initState();
    final p = widget.profile;
    _nama = TextEditingController(text: p.nama);
    _nim = TextEditingController(text: p.nim);
    _prodi = TextEditingController(text: p.prodi);
    _kelas = TextEditingController(text: p.kelas);
    _bio = TextEditingController(text: p.bio);
    _email = TextEditingController(text: p.email);
    _hp = TextEditingController(text: p.hp);
    _github = TextEditingController(text: p.github);
  }

  @override
  void dispose() {
    for (final c in [_nama, _nim, _prodi, _kelas, _bio, _email, _hp, _github]) {
      c.dispose();
    }
    super.dispose();
  }

  void _simpan() {
    if (!_formKey.currentState!.validate()) return;
    final dataBaru = Profile(
      nama: _nama.text.trim(),
      nim: _nim.text.trim(),
      prodi: _prodi.text.trim(),
      kelas: _kelas.text.trim(),
      bio: _bio.text.trim(),
      email: _email.text.trim(),
      hp: _hp.text.trim(),
      github: _github.text.trim(),
    );
    Navigator.pop(context, dataBaru);
  }

  Widget _field(String label, TextEditingController c,
      {String? Function(String?)? validator,
      TextInputType? type,
      int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: c,
        keyboardType: type,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _field('Nama lengkap', _nama,
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Nama wajib diisi' : null),
            _field('NIM', _nim),
            _field('Program studi', _prodi),
            _field('Kelas', _kelas),
            _field('Bio', _bio, maxLines: 3),
            _field('Email', _email,
                type: TextInputType.emailAddress,
                validator: (v) {
                  final value = v?.trim() ?? '';
                  final ok = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value);
                  return ok ? null : 'Email tidak valid';
                }),
            _field('No. HP', _hp,
                type: TextInputType.phone,
                validator: (v) {
                  final value = v?.trim() ?? '';
                  final ok = RegExp(r'^[0-9]{10,13}$').hasMatch(value);
                  return ok ? null : 'Hanya angka, 10–13 digit';
                }),
            _field('GitHub', _github),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: _simpan,
              icon: const Icon(Icons.save),
              label: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}