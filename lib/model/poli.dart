import 'package:flutter/material.dart';

class ClinicService {
  final String name;
  final String description;
  final String priceRange;
  final String duration;

  const ClinicService({
    required this.name,
    required this.description,
    required this.priceRange,
    required this.duration,
  });
}

class Poli {
  final int id;
  final String name;
  final IconData icon;
  final String description;
  final List<ClinicService> services;
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
      ClinicService(
        name: 'Pemeriksaan Umum',
        description:
            'Pemeriksaan fisik menyeluruh untuk mendiagnosa keluhan kesehatan umum seperti flu, batuk, dan demam.',
        priceRange: 'Rp 50.000 - Rp 100.000',
        duration: '15-20 menit',
      ),
      ClinicService(
        name: 'Konsultasi Dokter',
        description:
            'Sesi konsultasi mendalam mengenai gejala kesehatan, saran pencegahan penyakit, dan rujukan spesialis jika diperlukan.',
        priceRange: 'Rp 60.000',
        duration: '15 menit',
      ),
      ClinicService(
        name: 'Cek Tekanan Darah',
        description:
            'Pengukuran tekanan darah akurat untuk memantau hipertensi atau hipotensi.',
        priceRange: 'Rp 15.000',
        duration: '5 menit',
      ),
      ClinicService(
        name: 'Cek Gula Darah',
        description:
            'Tes cepat kadar gula darah sewaktu atau puasa untuk deteksi dini diabetes.',
        priceRange: 'Rp 25.000',
        duration: '5 menit',
      ),
      ClinicService(
        name: 'Surat Keterangan Sehat',
        description:
            'Pemeriksaan kesehatan untuk keperluan administrasi pekerjaan, sekolah, atau perjalanan.',
        priceRange: 'Rp 35.000',
        duration: '20 menit',
      ),
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
      ClinicService(
        name: 'Tambal Gigi',
        description:
            'Perbaikan gigi berlubang menggunakan bahan komposit berkualitas tinggi yang sewarna dengan gigi.',
        priceRange: 'Rp 150.000 - Rp 300.000',
        duration: '30-45 menit',
      ),
      ClinicService(
        name: 'Cabut Gigi',
        description:
            'Prosedur pencabutan gigi yang aman dan minim rasa sakit dengan anestesi lokal.',
        priceRange: 'Rp 150.000 - Rp 500.000',
        duration: '20-40 menit',
      ),
      ClinicService(
        name: 'Scaling (Pembersihan Karang)',
        description:
            'Pembersihan karang gigi menyeluruh menggunakan alat ultrasonic scaler untuk kesehatan gusi optimal.',
        priceRange: 'Rp 200.000 - Rp 400.000',
        duration: '30 menit',
      ),
      ClinicService(
        name: 'Perawatan Saluran Akar',
        description:
            'Perawatan untuk gigi yang infeksi sampai ke saraf, bertujuan mempertahankan gigi agar tidak perlu dicabut.',
        priceRange: 'Rp 500.000 - Rp 1.500.000',
        duration: '60 menit (Multiple visits)',
      ),
      ClinicService(
        name: 'Pemutihan Gigi',
        description:
            'Bleaching gigi profesional untuk senyum yang lebih cerah dan percaya diri.',
        priceRange: 'Rp 2.000.000 - Rp 3.500.000',
        duration: '60-90 menit',
      ),
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
      ClinicService(
        name: 'Pemeriksaan Anak',
        description:
            'Pemeriksaan kesehatan rutin untuk bayi dan anak yang sakit.',
        priceRange: 'Rp 100.000 - Rp 200.000',
        duration: '20-30 menit',
      ),
      ClinicService(
        name: 'Imunisasi',
        description:
            'Layanan vaksinasi dasar dan tambahan sesuai jadwal IDAI.',
        priceRange: 'Variatif sesuai jenis vaksin',
        duration: '15 menit',
      ),
      ClinicService(
        name: 'Konsultasi Tumbuh Kembang',
        description:
            'Evaluasi perkembangan motorik dan kognitif anak serta deteksi dini keterlambatan tumbuh kembang.',
        priceRange: 'Rp 150.000 - Rp 300.000',
        duration: '45 menit',
      ),
      ClinicService(
        name: 'Penanganan Demam',
        description:
            'Diagnosis dan tatalaksana cepat untuk anak dengan demam tinggi atau kejang demam.',
        priceRange: 'Rp 100.000',
        duration: '20 menit',
      ),
      ClinicService(
        name: 'Konsultasi Gizi Anak',
        description:
            'Saran nutrisi untuk masalah berat badan kurang, obesitas, atau susah makan pada anak.',
        priceRange: 'Rp 100.000',
        duration: '30 menit',
      ),
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
      ClinicService(
        name: 'Pemeriksaan Mata',
        description:
            'Pemeriksaan kesehatan mata umum untuk mendeteksi gangguan penglihatan.',
        priceRange: 'Rp 100.000',
        duration: '20 menit',
      ),
      ClinicService(
        name: 'Pengukuran Visus',
        description:
            'Tes ketajaman penglihatan untuk menentukan resep kacamata (minus, plus, silinder).',
        priceRange: 'Rp 50.000',
        duration: '15 menit',
      ),
      ClinicService(
        name: 'Penanganan Mata Merah',
        description:
            'Pengobatan infeksi atau iritasi mata seperti konjungtivitis.',
        priceRange: 'Rp 100.000 - Rp 150.000',
        duration: '20 menit',
      ),
      ClinicService(
        name: 'Konsultasi Kacamata',
        description:
            'Pemilihan lensa dan frame yang tepat sesuai kebutuhan medis dan gaya hidup.',
        priceRange: 'Gratis (dengan pembelian)',
        duration: '30 menit',
      ),
      ClinicService(
        name: 'Pemeriksaan Katarak',
        description:
            'Deteksi dini kekeruhan lensa mata pada pasien lanjut usia.',
        priceRange: 'Rp 150.000',
        duration: '30 menit',
      ),
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
      ClinicService(
        name: 'Pemeriksaan Telinga',
        description:
            'Otoskopi untuk melihat kondisi liang telinga dan gendang telinga.',
        priceRange: 'Rp 100.000',
        duration: '15 menit',
      ),
      ClinicService(
        name: 'Pemeriksaan Hidung',
        description: 'Pemeriksaan rongga hidung untuk sinusitis atau polip.',
        priceRange: 'Rp 100.000',
        duration: '15 menit',
      ),
      ClinicService(
        name: 'Pemeriksaan Tenggorokan',
        description: 'Diagnosis radang tenggorokan, amandel, atau laringitis.',
        priceRange: 'Rp 100.000',
        duration: '15 menit',
      ),
      ClinicService(
        name: 'Penanganan Sinusitis',
        description: 'Terapi untuk peradangan sinus kronis atau akut.',
        priceRange: 'Rp 150.000 - Rp 300.000',
        duration: '30 menit',
      ),
      ClinicService(
        name: 'Tes Pendengaran',
        description:
            'Audiometri sederhana untuk mengukur ambang pendengaran.',
        priceRange: 'Rp 200.000',
        duration: '30-45 menit',
      ),
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
      ClinicService(
        name: 'USG 4D',
        description:
            'Ultrasonografi 4 dimensi untuk melihat wajah dan gerakan janin secara realtime.',
        priceRange: 'Rp 400.000 - Rp 600.000',
        duration: '30 menit',
      ),
      ClinicService(
        name: 'Pemeriksaan Kehamilan',
        description: 'Kontrol rutin kesehatan ibu dan janin (Antenatal Care).',
        priceRange: 'Rp 150.000 - Rp 250.000',
        duration: '20 menit',
      ),
      ClinicService(
        name: 'Konsultasi Kesuburan',
        description: 'Program kehamilan untuk pasangan yang merencanakan buah hati.',
        priceRange: 'Rp 200.000 - Rp 400.000',
        duration: '45 menit',
      ),
      ClinicService(
        name: 'Imunisasi Ibu Hamil',
        description: 'Vaksin Tetanus (TT) dan lainnya untuk perlindungan ibu dan bayi.',
        priceRange: 'Rp 100.000',
        duration: '15 menit',
      ),
    ],
    location: 'Lantai 2, Sayap Barat',
    operatingHours: '09:00 - 15:00',
  ),
];