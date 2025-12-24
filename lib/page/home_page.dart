import 'package:flutter/material.dart';
import '../design_system.dart';
import '../components/glass_card.dart';
import 'daftar_poli_page.dart';
import 'doctor_list_page.dart';
import 'history_page.dart';
import 'profile_klinik_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animController,
        curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animController,
            curve: const Interval(0.2, 1.0, curve: Curves.easeOutCubic),
          ),
        );

    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // We use a simplified LiquidBackground-like structure but customized for scrolling
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

          // Scrollable Content
          CustomScrollView(
            slivers: [
              // Organic App Bar
              SliverAppBar(
                expandedHeight: 220,
                floating: false,
                pinned: true,
                backgroundColor: DesignSystem.primary,
                elevation: 0,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      // Liquid Header Background
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: DesignSystem.primaryGradient,
                          ),
                        ),
                      ),
                      // Decorative Organic Shapes
                      Positioned(
                        right: -40,
                        top: -40,
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                            ),
                          ),
                        ),
                      ),
                      // Content
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(
                                        DesignSystem.radiusMedium,
                                      ),
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.3),
                                        width: 1,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.local_hospital_rounded,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Klinik Sehat',
                                          style: DesignSystem.titleLarge
                                              .copyWith(
                                                color: Colors.white,
                                                fontSize: 26,
                                              ),
                                        ),
                                        Text(
                                          'Kesehatan Anda Prioritas Kami',
                                          style: DesignSystem.bodyMedium
                                              .copyWith(
                                                color: Colors.white.withOpacity(
                                                  0.9,
                                                ),
                                                fontSize: 14,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                            ],
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

              // Content Body
              SliverPadding(
                padding: const EdgeInsets.all(24),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Menu Utama', style: DesignSystem.titleMedium),
                            const SizedBox(height: 8),
                            Text(
                              'Pilih layanan yang Anda butuhkan',
                              style: DesignSystem.bodyMedium,
                            ),
                            const SizedBox(height: 24),

                            // Grid of Menu Items
                            _buildMenuGrid(context),

                            const SizedBox(height: 32),

                            // Quick Info Card
                            GlassCard(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: DesignSystem.secondary
                                              .withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(
                                            DesignSystem.radiusSmall,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.access_time_filled_rounded,
                                          color: DesignSystem.primary,
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        'Jam Operasional',
                                        style: DesignSystem.titleMedium
                                            .copyWith(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  _buildScheduleRow(
                                    'Senin - Jumat',
                                    '08:00 - 21:00',
                                  ),
                                  const SizedBox(height: 12),
                                  _buildScheduleRow('Sabtu', '08:00 - 17:00'),
                                  const SizedBox(height: 12),
                                  _buildScheduleRow('Minggu', '09:00 - 14:00'),
                                ],
                              ),
                            ),

                            const SizedBox(height: 32),

                            // Developer List
                            GlassCard(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kelompok',
                                    style: DesignSystem.titleMedium.copyWith(
                                      color: DesignSystem.textGrey,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  _buildDeveloperRow(
                                    'Yehezkiel Dio Sinolungan',
                                    '2311032',
                                  ),
                                  const SizedBox(height: 12),
                                  Divider(
                                    color: DesignSystem.primary.withOpacity(
                                      0.1,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  _buildDeveloperRow(
                                    'Ahmad Fauzan Fadhilah',
                                    '2311045',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 100), // Bottom padding
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuGrid(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildMenuItem(
                context,
                icon: Icons.medical_services_rounded,
                title: 'Layanan',
                color: const Color(0xFF1A7F7A),
                page: const DaftarPoliPage(),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildMenuItem(
                context,
                icon: Icons.person_search_rounded,
                title: 'Dokter',
                color: const Color(0xFFFF8A80),
                page: const DoctorListPage(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildMenuItem(
                context,
                icon: Icons.history_rounded,
                title: 'Riwayat',
                color: const Color(0xFF26A69A),
                page: const HistoryPage(),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildMenuItem(
                context,
                icon: Icons.apartment_rounded,
                title: 'Profil',
                color: const Color(0xFF5C6BC0),
                page: const ProfileKlinikPage(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
    required Widget page,
  }) {
    return RepaintBoundary(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, DesignSystem.createRoute(page));
        },
        child: Container(
          height: 140,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(DesignSystem.radiusLarge),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.15),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: DesignSystem.titleMedium.copyWith(fontSize: 16),
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: DesignSystem.textGrey.withOpacity(0.5),
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScheduleRow(String day, String hours) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(day, style: DesignSystem.bodyMedium),
        Text(
          hours,
          style: DesignSystem.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: DesignSystem.textDark,
          ),
        ),
      ],
    );
  }

  Widget _buildDeveloperRow(String name, String id) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: DesignSystem.liquidBlue,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.person_rounded,
            color: DesignSystem.primary,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: DesignSystem.bodyMedium.copyWith(
                color: DesignSystem.textDark,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              id,
              style: DesignSystem.bodyMedium.copyWith(
                fontSize: 14,
                color: DesignSystem.textGrey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
