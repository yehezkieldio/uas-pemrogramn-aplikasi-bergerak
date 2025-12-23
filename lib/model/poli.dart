import 'package:flutter/material.dart';

class Poli {
  final int id;
  final String name;
  final IconData icon;
  final String description;
  final List<String> services;
  final String location;
  final String operatingHours;

  const Poli({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
    required this.services,
    required this.location,
    required this.operatingHours,
  });
}

final List<Poli> daftarPoli = [
  const Poli(
    id: 1,
    name: 'Poli Umum',
    icon: Icons.medical_services_rounded,
    description:
        'Poli Umum melayani pemeriksaan kesehatan umum, konsultasi dokter, dan penanganan penyakit ringan hingga sedang. Tim dokter berpengalaman siap memberikan pelayanan terbaik untuk kesehatan Anda.',
    services: [
      'Pemeriksaan Umum',
      'Konsultasi Dokter',
      'Cek Tekanan Darah',
      'Cek Gula Darah',
      'Surat Keterangan Sehat',
    ],
    location: 'Lantai 1, Ruang 101-103',
    operatingHours: '08:00 - 20:00',
  ),
  const Poli(
    id: 2,
    name: 'Poli Gigi',
    icon: Icons.sentiment_satisfied_alt_rounded,
    description:
        'Poli Gigi menyediakan layanan perawatan gigi lengkap dengan peralatan modern. Dari pembersihan rutin hingga penanganan masalah gigi kompleks.',
    services: [
      'Tambal Gigi',
      'Cabut Gigi',
      'Scaling (Pembersihan Karang)',
      'Perawatan Saluran Akar',
      'Pemutihan Gigi',
    ],
    location: 'Lantai 2, Ruang 201-205',
    operatingHours: '09:00 - 17:00',
  ),
  const Poli(
    id: 3,
    name: 'Poli Anak',
    icon: Icons.child_care_rounded,
    description:
        'Poli Anak fokus pada kesehatan anak-anak dari bayi hingga remaja. Dokter spesialis anak kami berpengalaman menangani berbagai kondisi pediatrik.',
    services: [
      'Pemeriksaan Anak',
      'Imunisasi',
      'Konsultasi Tumbuh Kembang',
      'Penanganan Demam',
      'Konsultasi Gizi Anak',
    ],
    location: 'Lantai 1, Sayap Timur',
    operatingHours: '08:00 - 16:00',
  ),
  const Poli(
    id: 4,
    name: 'Poli Mata',
    icon: Icons.visibility_rounded,
    description:
        'Poli Mata menyediakan layanan pemeriksaan dan perawatan mata lengkap. Dilengkapi dengan teknologi terkini untuk diagnosis yang akurat.',
    services: [
      'Pemeriksaan Mata',
      'Pengukuran Visus',
      'Penanganan Mata Merah',
      'Konsultasi Kacamata',
      'Pemeriksaan Katarak',
    ],
    location: 'Lantai 3, Ruang 305',
    operatingHours: '10:00 - 18:00',
  ),
  const Poli(
    id: 5,
    name: 'Poli THT',
    icon: Icons.hearing_rounded,
    description:
        'Poli THT (Telinga, Hidung, Tenggorokan) menangani berbagai keluhan pada area THT dengan dokter spesialis berpengalaman.',
    services: [
      'Pemeriksaan Telinga',
      'Pemeriksaan Hidung',
      'Pemeriksaan Tenggorokan',
      'Penanganan Sinusitis',
      'Tes Pendengaran',
    ],
    location: 'Lantai 3, Ruang 308',
    operatingHours: '13:00 - 19:00',
  ),
  const Poli(
    id: 6,
    name: 'Poli Kandungan',
    icon: Icons.pregnant_woman_rounded,
    description:
        'Layanan kesehatan ibu dan janin yang komprehensif, mulai dari pemeriksaan kehamilan rutin hingga konsultasi kesuburan.',
    services: [
      'USG 4D',
      'Pemeriksaan Kehamilan',
      'Konsultasi Kesuburan',
      'Imunisasi Ibu Hamil',
    ],
    location: 'Lantai 2, Sayap Barat',
    operatingHours: '09:00 - 15:00',
  ),
];