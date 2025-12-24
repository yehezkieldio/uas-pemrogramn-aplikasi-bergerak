import 'package:flutter/material.dart';
import '../model/poli.dart';
import '../design_system.dart';
import '../components/glass_card.dart';
import 'daftar_layanan_page.dart';
import 'detail_poli_page.dart';

class DaftarPoliPage extends StatefulWidget {
  const DaftarPoliPage({super.key});

  @override
  State<DaftarPoliPage> createState() => _DaftarPoliPageState();
}

class _DaftarPoliPageState extends State<DaftarPoliPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignSystem.zenWhite,
      body: Stack(
        children: [
          // Gradient Background
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
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
              // Custom Organic AppBar
              SliverAppBar(
                expandedHeight: 120,
                floating: false,
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
                  title: Text(
                    'Daftar Poli Klinik',
                    style: DesignSystem.titleLarge.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: DesignSystem.primaryGradient,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -20,
                          top: -20,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(DesignSystem.radiusLarge),
                  ),
                ),
              ),

              // Instruction
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: DesignSystem.secondary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(
                        DesignSystem.radiusSmall,
                      ),
                      border: Border.all(
                        color: DesignSystem.secondary.withOpacity(0.2),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.touch_app_rounded,
                          color: DesignSystem.primary,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Tap untuk lihat layanan • Tekan lama untuk detail',
                            style: DesignSystem.bodyMedium.copyWith(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // List of Poli
              SliverPadding(
                padding: const EdgeInsets.all(24),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final poli = daftarPoli[index];

                    final animation = Tween<double>(begin: 0, end: 1).animate(
                      CurvedAnimation(
                        parent: _animController,
                        curve: Interval(
                          index * 0.1,
                          0.6 + index * 0.1,
                          curve: DesignSystem.curveOrganic,
                        ),
                      ),
                    );

                    return AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, 30 * (1 - animation.value)),
                          child: Opacity(
                            opacity: animation.value,
                            child: child,
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _buildOrganicPoliCard(context, poli),
                      ),
                    );
                  }, childCount: daftarPoli.length),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrganicPoliCard(BuildContext context, Poli poli) {
    return GlassCard(
      padding: EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            DesignSystem.createRoute(DaftarLayananPage(poli: poli)),
          );
        },
        onLongPress: () {
          Navigator.push(
            context,
            DesignSystem.createRoute(DetailPoliPage(poli: poli)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              // Liquid Icon Container
              Hero(
                tag: 'poli-icon-${poli.id}',
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: DesignSystem.primaryGradient,
                    borderRadius: BorderRadius.circular(
                      DesignSystem.radiusMedium,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: DesignSystem.primary.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Icon(poli.icon, color: Colors.white, size: 28),
                ),
              ),
              const SizedBox(width: 20),

              // Title and Subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      poli.name,
                      style: DesignSystem.titleMedium.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${poli.services.length} layanan tersedia',
                      style: DesignSystem.bodyMedium.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),

              // Arrow
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: DesignSystem.secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: DesignSystem.primary.withOpacity(0.8),
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
