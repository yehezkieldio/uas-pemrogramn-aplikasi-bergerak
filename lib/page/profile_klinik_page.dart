import 'package:flutter/material.dart';

class ProfileKlinikPage extends StatelessWidget {
  const ProfileKlinikPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A7F7A),
        elevation: 0,
        title: const Text(
          'Profil Klinik',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: -0.3),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.arrow_back_ios_rounded, size: 18),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with icon
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF1A7F7A),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Clinic Icon
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.local_hospital_rounded,
                      size: 60,
                      color: Color(0xFF1A7F7A),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Klinik Sehat',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sejak 2010',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),

            // Description
            Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8F5F3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.info_outline_rounded,
                            color: Color(0xFF1A7F7A),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Tentang Kami',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Klinik Sehat adalah fasilitas kesehatan terpercaya yang telah melayani masyarakat sejak tahun 2010. Kami berkomitmen memberikan pelayanan kesehatan berkualitas tinggi dengan harga terjangkau.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Didukung oleh tim dokter profesional dan peralatan medis modern, kami siap menjadi mitra kesehatan Anda dan keluarga.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 6 Buttons using Row and Column
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Akses Cepat',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Row 1 - 3 buttons
                  Row(
                    children: [
                      Expanded(
                        child: _buildQuickButton(
                          icon: Icons.phone_rounded,
                          label: 'Telepon',
                          color: const Color(0xFF1A7F7A),
                          onTap: () => _showSnackBar(context, 'Menghubungi...'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildQuickButton(
                          icon: Icons.email_rounded,
                          label: 'Email',
                          color: const Color(0xFF5C6BC0),
                          onTap: () => _showSnackBar(context, 'Email dibuka'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildQuickButton(
                          icon: Icons.location_on_rounded,
                          label: 'Lokasi',
                          color: const Color(0xFFFF7043),
                          onTap: () => _showSnackBar(context, 'Peta dibuka'),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Row 2 - 3 buttons
                  Row(
                    children: [
                      Expanded(
                        child: _buildQuickButton(
                          icon: Icons.calendar_month_rounded,
                          label: 'Jadwal',
                          color: const Color(0xFF26A69A),
                          onTap: () =>
                              _showSnackBar(context, 'Jadwal ditampilkan'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildQuickButton(
                          icon: Icons.star_rounded,
                          label: 'Rating',
                          color: const Color(0xFFFFCA28),
                          onTap: () => _showSnackBar(context, 'Rating: 4.8/5'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildQuickButton(
                          icon: Icons.share_rounded,
                          label: 'Bagikan',
                          color: const Color(0xFF42A5F5),
                          onTap: () => _showSnackBar(context, 'Link disalin!'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Contact info
            Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildContactRow(
                      Icons.location_on_rounded,
                      'Jl. Kesehatan No. 123, Jakarta Selatan',
                    ),
                    const SizedBox(height: 16),
                    _buildContactRow(Icons.phone_rounded, '(021) 123-4567'),
                    const SizedBox(height: 16),
                    _buildContactRow(
                      Icons.email_rounded,
                      'info@kliniksehat.com',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
      // FloatingActionButton
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showSnackBar(context, 'WhatsApp dibuka');
        },
        backgroundColor: const Color(0xFF25D366),
        icon: const Icon(Icons.chat_rounded),
        label: const Text(
          'Chat Kami',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildQuickButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
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
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
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
            color: const Color(0xFFE8F5F3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xFF1A7F7A), size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
          ),
        ),
      ],
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: const Color(0xFF1A7F7A),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
