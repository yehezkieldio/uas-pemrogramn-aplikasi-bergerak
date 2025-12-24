import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/doctor.dart';
import '../model/booking.dart';
import '../service/booking_service.dart';
import '../design_system.dart';
import '../components/glass_card.dart';
import '../components/organic_button.dart';

class BookingPage extends StatefulWidget {
  final Doctor doctor;

  const BookingPage({super.key, required this.doctor});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime _selectedDate = DateTime.now();
  String? _selectedTime;
  final List<String> _timeSlots = [
    '09:00',
    '10:00',
    '11:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '19:00',
    '20:00',
  ];

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
                expandedHeight: 120, // Reduced height
                pinned: true,
                backgroundColor: DesignSystem.primary,
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
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
                    'Buat Janji Temu',
                    style: DesignSystem.titleLarge.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: DesignSystem.primaryGradient,
                    ),
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
                      // Doctor Summary Card
                      GlassCard(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: DesignSystem.liquidBlue,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.person_rounded,
                                  size: 40,
                                  color: Color(0xFFCFD8DC),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.doctor.name,
                                    style: DesignSystem.titleMedium.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    widget.doctor.specialty,
                                    style: DesignSystem.bodyMedium.copyWith(
                                      fontSize: 14,
                                      color: DesignSystem.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Date Selection
                      Text(
                        'Pilih Tanggal',
                        style: DesignSystem.titleMedium.copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: List.generate(7, (index) {
                            final date = DateTime.now().add(
                              Duration(days: index),
                            );
                            final isSelected =
                                date.day == _selectedDate.day &&
                                date.month == _selectedDate.month &&
                                date.year == _selectedDate.year;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedDate = date;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 12),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? DesignSystem.primary
                                      : Colors.white.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: isSelected
                                        ? Colors.transparent
                                        : Colors.white.withOpacity(0.4),
                                  ),
                                  boxShadow: isSelected
                                      ? [
                                          BoxShadow(
                                            color: DesignSystem.primary
                                                .withOpacity(0.3),
                                            blurRadius: 10,
                                            offset: const Offset(0, 5),
                                          ),
                                        ]
                                      : null,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      DateFormat('EEE').format(date),
                                      style: DesignSystem.bodyMedium.copyWith(
                                        fontSize: 14,
                                        color: isSelected
                                            ? Colors.white.withOpacity(0.9)
                                            : DesignSystem.textGrey,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      DateFormat('d').format(date),
                                      style: DesignSystem.titleLarge.copyWith(
                                        fontSize: 20,
                                        color: isSelected
                                            ? Colors.white
                                            : DesignSystem.textDark,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Time Selection
                      Text(
                        'Pilih Jam',
                        style: DesignSystem.titleMedium.copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 2.5,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                        itemCount: _timeSlots.length,
                        itemBuilder: (context, index) {
                          final time = _timeSlots[index];
                          final isSelected = _selectedTime == time;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedTime = time;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              curve: DesignSystem.curveOrganic,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? DesignSystem.primary
                                    : Colors.white.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.transparent
                                      : Colors.white.withOpacity(0.4),
                                ),
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: DesignSystem.primary
                                              .withOpacity(0.3),
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                        ),
                                      ]
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  time,
                                  style: DesignSystem.bodyMedium.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : DesignSystem.textDark,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 100), // Bottom padding
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Bottom Button with Glass Effect
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: GlassCard(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(32),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: OrganicButton(
                  text: 'Konfirmasi Booking',
                  onTap: _selectedTime == null ? () {} : _confirmBooking,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmBooking() {
    if (_selectedTime == null) return;

    final booking = Booking(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      doctorId: widget.doctor.id,
      date: _selectedDate,
      time: _selectedTime!,
      status: BookingStatus.upcoming,
      queueNumber: DateTime.now().second % 20 + 1, // Random queue number
    );

    BookingService().addBooking(booking);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: GlassCard(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: DesignSystem.secondary.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  color: DesignSystem.primary,
                  size: 48,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Booking Berhasil!',
                style: DesignSystem.titleLarge.copyWith(
                  fontSize: 20,
                  color: DesignSystem.textDark,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Tiket antrian Anda telah tersimpan di menu Riwayat.',
                textAlign: TextAlign.center,
                style: DesignSystem.bodyMedium.copyWith(
                  color: DesignSystem.textGrey,
                ),
              ),
              const SizedBox(height: 32),
              OrganicButton(
                text: 'Selesai',
                onTap: () {
                  Navigator.pop(context); // Pop dialog
                  Navigator.pop(context); // Pop booking page
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
