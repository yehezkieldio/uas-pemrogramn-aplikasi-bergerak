import 'package:flutter/material.dart';
import '../model/doctor.dart';
import '../design_system.dart';
import '../components/glass_card.dart';
import '../components/organic_button.dart';
import 'booking_page.dart';

class DoctorDetailPage extends StatelessWidget {
  final Doctor doctor;

  const DoctorDetailPage({super.key, required this.doctor});

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

          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // Header App Bar
              SliverAppBar(
                expandedHeight: 320,
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
                    fit: StackFit.expand,
                    children: [
                      // Gradient Background
                      Container(
                        decoration: const BoxDecoration(
                          gradient: DesignSystem.primaryGradient,
                        ),
                      ),
                      // Liquid Patterns
                      Positioned(
                        right: -60,
                        top: 40,
                        child: Container(
                          width: 220,
                          height: 220,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(100),
                              bottomLeft: Radius.circular(60),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: -40,
                        top: 120,
                        child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      // Doctor Avatar Big
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 30,
                                offset: const Offset(0, 15),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.person_rounded,
                            size: 100,
                            color: DesignSystem.textGrey.withOpacity(0.5),
                          ),
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

              // Content
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      // Name and Specialty
                      Text(
                        doctor.name,
                        style: DesignSystem.titleLarge.copyWith(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: DesignSystem.secondary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          doctor.specialty,
                          style: DesignSystem.bodyMedium.copyWith(
                            color: DesignSystem.primary,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Stats Row
                      GlassCard(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildStatItem(
                              'Rating',
                              doctor.rating.toString(),
                              Icons.star_rounded,
                              const Color(0xFFFBC02D),
                            ),
                            Container(
                              width: 1,
                              height: 40,
                              color: DesignSystem.textGrey.withOpacity(0.2),
                            ),
                            _buildStatItem(
                              'Pengalaman',
                              '${doctor.experienceYears} Thn',
                              Icons.work_rounded,
                              const Color(0xFF5C6BC0),
                            ),
                            Container(
                              width: 1,
                              height: 40,
                              color: DesignSystem.textGrey.withOpacity(0.2),
                            ),
                            _buildStatItem(
                              'Pasien',
                              '1k+',
                              Icons.people_rounded,
                              const Color(0xFFEF5350),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // About Section
                      _buildSectionHeader('Tentang Dokter'),
                      const SizedBox(height: 16),
                      Text(
                        doctor.description,
                        style: DesignSystem.bodyMedium.copyWith(
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Schedule Section
                      _buildSectionHeader('Jadwal Praktik'),
                      const SizedBox(height: 16),
                      GlassCard(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            _buildScheduleRow(
                              Icons.calendar_today_rounded,
                              'Hari Praktik',
                              doctor.availableDays.join(', '),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Divider(
                                height: 1,
                                color: DesignSystem.textGrey.withOpacity(0.1),
                              ),
                            ),
                            _buildScheduleRow(
                              Icons.access_time_rounded,
                              'Jam Praktik',
                              doctor.availableHours,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Book Button using OrganicButton
                      OrganicButton(
                        text: 'Buat Janji Konsultasi',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingPage(doctor: doctor),
                            ),
                          );
                        },
                        icon: Icons.calendar_month_rounded,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 8),
        Text(value, style: DesignSystem.titleMedium.copyWith(fontSize: 18)),
        const SizedBox(height: 4),
        Text(
          label,
          style: DesignSystem.bodyMedium.copyWith(
            fontSize: 12,
            color: DesignSystem.textGrey,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
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
        Text(title, style: DesignSystem.titleMedium.copyWith(fontSize: 18)),
      ],
    );
  }

  Widget _buildScheduleRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: DesignSystem.secondary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: DesignSystem.primary, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: DesignSystem.bodyMedium.copyWith(
                  fontSize: 12,
                  color: DesignSystem.textGrey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: DesignSystem.titleMedium.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
