import 'package:flutter/material.dart';
import '../model/poli.dart';
import '../model/doctor.dart';
import '../design_system.dart';
import '../components/glass_card.dart';
import 'doctor_detail_page.dart';
import 'detail_layanan_page.dart';

class DetailPoliPage extends StatelessWidget {
  final Poli poli;

  const DetailPoliPage({super.key, required this.poli});

  @override
  Widget build(BuildContext context) {
    // Filter doctors by this poli
    final doctors = daftarDokter
        .where((d) => d.specialty == poli.name)
        .toList();

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

          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // Hero header
              SliverAppBar(
                expandedHeight: 280,
                pinned: true,
                backgroundColor: DesignSystem.primary,
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
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
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Stack(
                    children: [
                      // Gradient background
                      Container(
                        decoration: const BoxDecoration(
                          gradient: DesignSystem.primaryGradient,
                        ),
                      ),
                      // Liquid Blob decorations
                      Positioned(
                        right: -60,
                        top: -40,
                        child: Container(
                          width: 220,
                          height: 220,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(110),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: -40,
                        bottom: 40,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      // Icon and title
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 20),
                            // Hero icon container
                            Hero(
                              tag: 'poli-icon-${poli.id}',
                              child: RepaintBoundary(
                                child: Container(
                                  padding: const EdgeInsets.all(28),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        blurRadius: 30,
                                        offset: const Offset(0, 15),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    poli.icon,
                                    size: 56,
                                    color: DesignSystem.primary,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              poli.name,
                              style: DesignSystem.titleLarge.copyWith(
                                color: Colors.white,
                                fontSize: 24, // Slightly smaller for better fit
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(DesignSystem.radiusLarge),
                  ),
                ),
              ),

              // Content Body
              SliverPadding(
                padding: const EdgeInsets.all(24),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // Info Row (Location & Hours)
                    Row(
                      children: [
                        Expanded(
                          child: _buildOrganicInfoCard(
                            Icons.location_on_rounded,
                            'Lokasi',
                            poli.location,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildOrganicInfoCard(
                            Icons.access_time_filled_rounded,
                            'Jam Buka',
                            poli.operatingHours,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Description card
                    GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: DesignSystem.secondary.withOpacity(
                                    0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.description_rounded,
                                  color: DesignSystem.primary,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Deskripsi',
                                style: DesignSystem.titleMedium.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            poli.description,
                            style: DesignSystem.bodyMedium.copyWith(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Available Doctors (Horizontal List)
                    if (doctors.isNotEmpty) ...[
                      Row(
                        children: [
                          Container(
                            width: 4,
                            height: 24,
                            decoration: BoxDecoration(
                              color: DesignSystem.primary,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text('Dokter Kami', style: DesignSystem.titleMedium),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 200, // Increased height to prevent overflow
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: doctors.length,
                          cacheExtent: 100, // Preload offscreen items
                          itemBuilder: (context, index) {
                            return RepaintBoundary(
                              key: ValueKey(doctors[index].id),
                              child: _buildDoctorCard(context, doctors[index]),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Services preview
                    GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: DesignSystem.secondary.withOpacity(
                                    0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.medical_services_rounded,
                                  color: DesignSystem.primary,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Layanan Tersedia',
                                style: DesignSystem.titleMedium.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: poli.services.map((service) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailLayananPage(
                                        service: service,
                                        poliName: poli.name,
                                      ),
                                    ),
                                  );
                                },
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: DesignSystem.secondary.withOpacity(
                                      0.1,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: DesignSystem.secondary.withOpacity(
                                        0.2,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    service.name,
                                    style: DesignSystem.bodyMedium.copyWith(
                                      color: DesignSystem.primary,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 100), // Bottom padding
                  ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrganicInfoCard(IconData icon, String title, String value) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: DesignSystem.liquidBlue,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: DesignSystem.primary, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: DesignSystem.bodyMedium.copyWith(
              fontSize: 12,
              color: DesignSystem.textGrey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: DesignSystem.bodyMedium.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: DesignSystem.textDark,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorCard(BuildContext context, Doctor doctor) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          DesignSystem.createRoute(DoctorDetailPage(doctor: doctor)),
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 16),
        child: GlassCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: DesignSystem.liquidBlue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person_rounded,
                  color: Color(0xFFCFD8DC),
                  size: 40,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                doctor.name,
                style: DesignSystem.bodyMedium.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: DesignSystem.textDark,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF9C4), // Light yellow
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
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
        ),
      ),
    );
  }
}
