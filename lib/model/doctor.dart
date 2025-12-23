class Doctor {
  final int id;
  final String name;
  final String specialty; // Maps to Poli name
  final double rating;
  final int experienceYears;
  final String description;
  final List<String> availableDays;
  final String availableHours;
  final String imageAsset; // Placeholder logic will be used

  const Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.experienceYears,
    required this.description,
    required this.availableDays,
    required this.availableHours,
    this.imageAsset = 'assets/doctor_placeholder.png', // We'll handle this in UI
  });
}

final List<Doctor> daftarDokter = [
  const Doctor(
    id: 1,
    name: 'dr. Andi Pratama, Sp.PD',
    specialty: 'Poli Umum',
    rating: 4.8,
    experienceYears: 12,
    description: 'Dokter Andi adalah spesialis penyakit dalam dengan pengalaman lebih dari 10 tahun. Beliau dikenal ramah dan detail dalam memberikan diagnosa.',
    availableDays: ['Senin', 'Rabu', 'Jumat'],
    availableHours: '09:00 - 14:00',
  ),
  const Doctor(
    id: 2,
    name: 'drg. Sinta Melati',
    specialty: 'Poli Gigi',
    rating: 4.9,
    experienceYears: 8,
    description: 'Dokter gigi Sinta ahli dalam estetika gigi dan bedah mulut. Pendekatannya yang lembut sangat disukai oleh pasien yang takut ke dokter gigi.',
    availableDays: ['Selasa', 'Kamis', 'Sabtu'],
    availableHours: '10:00 - 16:00',
  ),
  const Doctor(
    id: 3,
    name: 'dr. Budi Santoso, Sp.A',
    specialty: 'Poli Anak',
    rating: 5.0,
    experienceYears: 15,
    description: 'Dokter Budi sangat disukai anak-anak. Beliau memiliki metode khusus agar anak-anak tidak takut saat diperiksa dan diimunisasi.',
    availableDays: ['Senin', 'Selasa', 'Kamis'],
    availableHours: '08:00 - 12:00',
  ),
  const Doctor(
    id: 4,
    name: 'dr. Maya Wijaya, Sp.M',
    specialty: 'Poli Mata',
    rating: 4.7,
    experienceYears: 10,
    description: 'Spesialis mata yang berpengalaman menangani katarak dan kelainan refraksi. Menggunakan teknologi terbaru dalam setiap pemeriksaannya.',
    availableDays: ['Rabu', 'Jumat'],
    availableHours: '13:00 - 17:00',
  ),
  const Doctor(
    id: 5,
    name: 'dr. Reza Rahardian, Sp.THT-KL',
    specialty: 'Poli THT',
    rating: 4.8,
    experienceYears: 11,
    description: 'Ahli THT yang fokus pada gangguan pendengaran dan sinus. Aktif dalam berbagai seminar kesehatan nasional.',
    availableDays: ['Senin', 'Kamis', 'Sabtu'],
    availableHours: '15:00 - 19:00',
  ),
  const Doctor(
    id: 6,
    name: 'dr. Citra Lestari',
    specialty: 'Poli Umum',
    rating: 4.6,
    experienceYears: 5,
    description: 'Dokter muda yang energik dan up-to-date dengan perkembangan medis terkini. Fokus pada kesehatan preventif.',
    availableDays: ['Selasa', 'Kamis', 'Sabtu'],
    availableHours: '16:00 - 21:00',
  ),
];
