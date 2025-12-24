import 'package:flutter/material.dart';
import '../model/poli.dart';
import '../design_system.dart';
import '../components/glass_card.dart';
import 'detail_layanan_page.dart';

class DaftarLayananPage extends StatefulWidget {
  final Poli poli;

  const DaftarLayananPage({super.key, required this.poli});

  @override
  State<DaftarLayananPage> createState() => _DaftarLayananPageState();
}

class _DaftarLayananPageState extends State<DaftarLayananPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late List<ClinicService> _layanan;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();

    _layanan = widget.poli.services;
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
              // Organic AppBar
              SliverAppBar(
                expandedHeight: 180,
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
                  background: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          gradient: DesignSystem.primaryGradient,
                        ),
                      ),
                      Positioned(
                        right: -30,
                        top: -30,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 20,
                        child: SafeArea(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Hero(
                                tag: 'poli-icon-${widget.poli.id}',
                                child: RepaintBoundary(
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      widget.poli.icon,
                                      color: DesignSystem.primary,
                                      size: 32,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.poli.name,
                                    style: DesignSystem.titleLarge.copyWith(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),
                                  Text(
                                    '${_layanan.length} layanan tersedia',
                                    style: DesignSystem.bodyMedium.copyWith(
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                  ),
                                ],
                              ),
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

              // Services List
              SliverPadding(
                padding: const EdgeInsets.all(24),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final layanan = _layanan[index];

                    final animation = Tween<double>(begin: 0, end: 1).animate(
                      CurvedAnimation(
                        parent: _animController,
                        curve: Interval(
                          index * 0.12,
                          0.5 + index * 0.1,
                          curve: DesignSystem.curveOrganic,
                        ),
                      ),
                    );

                    return AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        // Clamp value to prevent offset exceptions
                        final value = animation.value.clamp(0.0, 1.0);
                        return Transform.translate(
                          offset: Offset(0, 20 * (1 - value)),
                          child: Opacity(opacity: value, child: child),
                        );
                      },
                      child: RepaintBoundary(
                        key: ValueKey(layanan.name),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _buildOrganicLayananCard(layanan, index),
                        ),
                      ),
                    );
                  }, childCount: _layanan.length),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrganicLayananCard(ClinicService layanan, int index) {
    return GlassCard(
      padding: EdgeInsets.zero,
      blurEnabled: false, // Disabled in list for performance
      onTap: () {
        Navigator.push(
          context,
          DesignSystem.createRoute(
            DetailLayananPage(service: layanan, poliName: widget.poli.name),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Index Bubble
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    DesignSystem.primary.withOpacity(0.1),
                    DesignSystem.secondary.withOpacity(0.2),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: DesignSystem.titleMedium.copyWith(
                    color: DesignSystem.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    layanan.name,
                    style: DesignSystem.titleMedium.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    layanan.priceRange,
                    style: DesignSystem.bodyMedium.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ),

            // Icon
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: DesignSystem.zenWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.arrow_forward_rounded,
                size: 20,
                color: DesignSystem.primary.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
