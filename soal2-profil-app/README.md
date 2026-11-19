# UTS PML - Aplikasi Profil Mahasiswa

Aplikasi profil mahasiswa berbasis Flutter untuk tugas UTS.

**Nama:** Sri Asih Agustina
**NIM:** 1124160016
**Prodi:** Teknik Informatika
**Kelas:** SE-3

## Video Presentasi

https://www.youtube.com/@inaa4321

## Fitur

- **Login** dengan validasi form (kolom wajib diisi, password minimal 6 karakter), tombol tampilkan/sembunyikan password, dan indikator loading
- **Halaman Profil**: foto, nama, NIM, prodi, kelas, bio, serta email, nomor HP, dan GitHub
- **Edit Profil** dengan validasi (nama wajib, format email, nomor HP 10-13 digit)
- **Tentang Saya**: keahlian, hobi, dan riwayat pendidikan
- **Drawer** navigasi (Profil, Tentang Saya, Keluar)
- **Mode gelap / terang** lewat tombol di AppBar
- Data profil tetap tersimpan di memori aplikasi saat logout

## Akun Demo

| Username | Password |
|---|---|
| `ina@gmail.com` | `123456` |

## Struktur Kode

```
lib/
├── main.dart                     # titik awal, tema, dan named routes
├── models/
│   └── profile.dart              # class Profile dan data currentProfile
├── screens/
│   ├── about_page.dart           # halaman Tentang Saya
│   ├── edit_profile_page.dart    # form edit profil
│   ├── profile_page.dart         # halaman profil utama
│   └── login_page.dart           # halaman login
└── widgets/
    └── info_tile.dart            # widget kartu informasi
```

## Cara Menjalankan

Syarat: Flutter SDK terbaru.

```bash
flutter pub get
flutter run
```

## Build APK

```bash
flutter build apk --release
```

Hasilnya ada di `build/app/outputs/flutter-apk/app-release.apk`.