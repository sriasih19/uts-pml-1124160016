class Profile {
  final String nama;
  final String nim;
  final String prodi;
  final String kelas;
  final String bio;
  final String email;
  final String hp;
  final String github;

  const Profile({
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.kelas,
    required this.bio,
    required this.email,
    required this.hp,
    required this.github,
  });
}

Profile currentProfile = const Profile(
  nama: 'Sri Asih Agustina',
  nim: '1124160016',
  prodi: 'Teknik Informatika',
  kelas: 'SE-3',
  bio: 'Mahasiswa yang suka belajar pemrograman mobile.',
  email: 'INA@email.com',
  hp: '081234567890',
  github: 'github.com/sriasih19',
);