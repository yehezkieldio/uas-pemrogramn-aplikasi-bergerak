import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../design_system.dart';
import '../components/glass_card.dart';

class ProfileKlinikPage extends StatelessWidget {
  const ProfileKlinikPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignSystem.zenWhite,
      body: Stack(
        children: [
          // Background Gradient
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
              SliverAppBar(
                expandedHeight: 300,
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
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          gradient: DesignSystem.primaryGradient,
                        ),
                      ),
                      // Liquid Decorations
                      Positioned(
                        top: -50,
                        right: -50,
                        child: Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: -30,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 30,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.local_hospital_rounded,
                              size: 60,
                              color: DesignSystem.primary,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Klinik Sehat',
                            style: DesignSystem.titleLarge.copyWith(
                              color: Colors.white,
                              fontSize: 28,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Sejak 2010',
                              style: DesignSystem.bodyMedium.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
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

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Description
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
                                    Icons.info_outline_rounded,
                                    color: DesignSystem.primary,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  'Tentang Kami',
                                  style: DesignSystem.titleMedium.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Klinik Sehat adalah fasilitas kesehatan terpercaya yang telah melayani masyarakat sejak tahun 2010. Kami berkomitmen memberikan pelayanan kesehatan berkualitas tinggi dengan harga terjangkau.',
                              style: DesignSystem.bodyMedium.copyWith(
                                fontSize: 15,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Didukung oleh tim dokter profesional dan peralatan medis modern, kami siap menjadi mitra kesehatan Anda dan keluarga.',
                              style: DesignSystem.bodyMedium.copyWith(
                                fontSize: 15,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      Text(
                        'Akses Cepat',
                        style: DesignSystem.titleMedium.copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: 16),

                      // Grid of buttons
                      Row(
                        children: [
                          Expanded(
                            child: _buildOrganicQuickButton(
                              Icons.phone_rounded,
                              'Telepon',
                              DesignSystem.primary,
                              () => _showSnackBar(context, 'Menghubungi...'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildOrganicQuickButton(
                              Icons.email_rounded,
                              'Email',
                              const Color(0xFF5C6BC0),
                              () => _showSnackBar(context, 'Email dibuka'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildOrganicQuickButton(
                              Icons.location_on_rounded,
                              'Lokasi',
                              const Color(0xFFFF7043),
                              () => _showSnackBar(context, 'Peta dibuka'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: _buildOrganicQuickButton(
                              Icons.calendar_month_rounded,
                              'Jadwal',
                              const Color(0xFF26A69A),
                              () =>
                                  _showSnackBar(context, 'Jadwal ditampilkan'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildOrganicQuickButton(
                              Icons.star_rounded,
                              'Rating',
                              const Color(0xFFFFCA28),
                              () => _showSnackBar(context, 'Rating: 4.8/5'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildOrganicQuickButton(
                              Icons.share_rounded,
                              'Bagikan',
                              const Color(0xFF42A5F5),
                              () => _showSnackBar(context, 'Link disalin!'),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Contact Info
                      GlassCard(
                        child: Column(
                          children: [
                            _buildContactRow(
                              Icons.location_on_rounded,
                              'Jl. Kesehatan No. 123, Balikpapan',
                            ),
                            const SizedBox(height: 16),
                            _buildContactRow(
                              Icons.phone_rounded,
                              '(021) 123-4567',
                            ),
                            const SizedBox(height: 16),
                            _buildContactRow(
                              Icons.email_rounded,
                              'info@kliniksehat.com',
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          const String youtubeUrl =
              "https://youtu.be/G04XxfE-W-k?si=2Ndvf1mdavRK9Uk1";
          final Uri uri = Uri.parse(youtubeUrl);

          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            // ignore: use_build_context_synchronously
            _showSnackBar(context, 'Could not open the link');
          }
        },
        backgroundColor: const Color(0xFF25D366),
        icon: const Icon(Icons.chat_rounded),
        label: Text(
          'Chat Kami',
          style: DesignSystem.titleMedium.copyWith(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildOrganicQuickButton(
    IconData icon,
    String label,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: GlassCard(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: DesignSystem.bodyMedium.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: DesignSystem.textGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: DesignSystem.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: DesignSystem.primary, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: DesignSystem.bodyMedium.copyWith(
              color: DesignSystem.textDark,
            ),
          ),
        ),
      ],
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: DesignSystem.bodyMedium.copyWith(color: Colors.white),
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: DesignSystem.primary,
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
