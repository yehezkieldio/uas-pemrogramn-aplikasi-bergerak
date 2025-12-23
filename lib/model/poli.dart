import 'package:flutter/material.dart';

class Poli {
  final int id;
  final String name;
  final IconData icon;
  final String description;
  final List<String> services;

  const Poli({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
    required this.services,
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
  ),
];
