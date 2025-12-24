import 'package:flutter/material.dart';
import '../model/doctor.dart';
import '../model/poli.dart';
import '../design_system.dart';
import '../components/glass_card.dart';
import 'doctor_detail_page.dart';

class DoctorListPage extends StatefulWidget {
  const DoctorListPage({super.key});

  @override
  State<DoctorListPage> createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  String _selectedPoli = 'Semua';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  List<Doctor> get _filteredDoctors {
    return daftarDokter.where((doctor) {
      final matchesPoli =
          _selectedPoli == 'Semua' || doctor.specialty == _selectedPoli;
      final matchesSearch = doctor.name.toLowerCase().contains(
        _searchQuery.toLowerCase(),
      );
      return matchesPoli && matchesSearch;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignSystem.zenWhite,
      body: Stack(
        children: [
          // Background Gradient
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [DesignSystem.zenWhite, DesignSystem.liquidBlue],
                  stops: [0.3, 1.0],
                ),
              ),
            ),
          ),

          Column(
            children: [
              // Custom Header with Search
              Container(
                padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
                decoration: const BoxDecoration(
                  gradient: DesignSystem.primaryGradient,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(DesignSystem.radiusLarge),
                    bottomRight: Radius.circular(DesignSystem.radiusLarge),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Top Bar
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Cari Dokter',
                            textAlign: TextAlign.center,
                            style: DesignSystem.titleLarge.copyWith(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 40), // Balance
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Search Bar
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _searchController,
                        style: DesignSystem.bodyMedium.copyWith(
                          color: DesignSystem.textDark,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Cari nama dokter...',
                          hintStyle: DesignSystem.bodyMedium.copyWith(
                            color: DesignSystem.textGrey.withOpacity(0.5),
                          ),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.search_rounded,
                            color: DesignSystem.primary.withOpacity(0.6),
                          ),
                          suffixIcon: _searchQuery.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.close_rounded),
                                  color: DesignSystem.textGrey,
                                  onPressed: () {
                                    _searchController.clear();
                                    setState(() {
                                      _searchQuery = '';
                                    });
                                  },
                                )
                              : null,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Filter Chips
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildOrganicFilterChip('Semua'),
                          ...daftarPoli.map(
                            (poli) => _buildOrganicFilterChip(poli.name),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Doctor List
              Expanded(
                child: _filteredDoctors.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                        padding: const EdgeInsets.all(24),
                        physics: const BouncingScrollPhysics(),
                        itemCount: _filteredDoctors.length,
                        itemBuilder: (context, index) {
                          final doctor = _filteredDoctors[index];
                          return RepaintBoundary(
                            key: ValueKey(doctor.id),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: _buildOrganicDoctorCard(doctor),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrganicFilterChip(String label) {
    final isSelected = _selectedPoli == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPoli = label;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : Colors.white.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? DesignSystem.primary
                : Colors.white.withOpacity(0.9),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            fontSize: 13,
            fontFamily: DesignSystem.bodyMedium.fontFamily,
          ),
        ),
      ),
    );
  }

  Widget _buildOrganicDoctorCard(Doctor doctor) {
    return GlassCard(
      padding: EdgeInsets.zero,
      onTap: () {
        Navigator.push(
          context,
          DesignSystem.createRoute(DoctorDetailPage(doctor: doctor)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar Placeholder
            Container(
              width: 80,
              height: 100,
              decoration: BoxDecoration(
                color: DesignSystem.liquidBlue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  const Positioned.fill(
                    child: Center(
                      child: Icon(
                        Icons.person_rounded,
                        size: 50,
                        color: Color(0xFFCFD8DC),
                      ),
                    ),
                  ),
                  // Online Indicator
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: DesignSystem.secondary,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          doctor.name,
                          style: DesignSystem.titleMedium.copyWith(
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF9C4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              size: 14,
                              color: Color(0xFFFBC02D),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              doctor.rating.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFF9A825),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Specialty
                  Text(
                    doctor.specialty,
                    style: DesignSystem.bodyMedium.copyWith(
                      fontSize: 13,
                      color: DesignSystem.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Experience
                  Text(
                    '${doctor.experienceYears} Tahun Pengalaman',
                    style: DesignSystem.bodyMedium.copyWith(
                      fontSize: 12,
                      color: DesignSystem.textGrey,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Action Button
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: DesignSystem.secondary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Buat Janji',
                        style: DesignSystem.bodyMedium.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: DesignSystem.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 80,
            color: Colors.grey.withOpacity(0.4),
          ),
          const SizedBox(height: 16),
          Text(
            'Dokter tidak ditemukan',
            style: DesignSystem.titleMedium.copyWith(
              color: DesignSystem.textGrey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Coba ubah filter atau kata kunci',
            style: DesignSystem.bodyMedium,
          ),
        ],
      ),
    );
  }
}
