import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../service/booking_service.dart';
import '../model/booking.dart';
import '../model/doctor.dart';
import '../design_system.dart';
import '../components/glass_card.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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

          NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight:
                      120, // Reduced height since no complex flexible space
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
                  centerTitle: true,
                  title: Text(
                    'Riwayat Janji',
                    style: DesignSystem.titleLarge.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  bottom: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.white,
                    indicatorWeight: 4,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelStyle: DesignSystem.titleMedium.copyWith(
                      color: Colors.white,
                    ),
                    unselectedLabelStyle: DesignSystem.bodyMedium.copyWith(
                      color: Colors.white.withOpacity(0.7),
                    ),
                    tabs: const [
                      Tab(text: 'Mendatang'),
                      Tab(text: 'Selesai'),
                    ],
                  ),
                  flexibleSpace: Container(
                    decoration: const BoxDecoration(
                      gradient: DesignSystem.primaryGradient,
                    ),
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(DesignSystem.radiusLarge),
                    ),
                  ),
                ),
              ];
            },
            body: AnimatedBuilder(
              animation: BookingService(),
              builder: (context, _) {
                final upcoming = BookingService().upcomingBookings;
                final past = BookingService().pastBookings;

                return TabBarView(
                  controller: _tabController,
                  children: [
                    _buildBookingList(upcoming),
                    _buildBookingList(past),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingList(List<Booking> bookings) {
    if (bookings.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: DesignSystem.liquidBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.calendar_month_outlined,
                size: 60,
                color: DesignSystem.primary.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Belum ada janji temu',
              style: DesignSystem.titleMedium.copyWith(
                color: DesignSystem.textGrey,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(24),
      physics: const BouncingScrollPhysics(),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        final doctor = daftarDokter.firstWhere((d) => d.id == booking.doctorId);

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _buildOrganicBookingCard(booking, doctor),
        );
      },
    );
  }

  Widget _buildOrganicBookingCard(Booking booking, Doctor doctor) {
    return GlassCard(
      padding: EdgeInsets.zero, // Custom padding inside
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                // Doctor Avatar
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: DesignSystem.liquidBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person_rounded,
                      color: Color(0xFFCFD8DC),
                      size: 36,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name,
                        style: DesignSystem.titleMedium.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        doctor.specialty,
                        style: DesignSystem.bodyMedium.copyWith(
                          fontSize: 14,
                          color: DesignSystem.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                // Queue Number Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: DesignSystem.secondary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: DesignSystem.secondary.withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Antrian',
                        style: DesignSystem.bodyMedium.copyWith(
                          fontSize: 10,
                          color: DesignSystem.textGrey,
                        ),
                      ),
                      Text(
                        '#${booking.queueNumber}',
                        style: DesignSystem.titleMedium.copyWith(
                          fontSize: 20,
                          color: DesignSystem.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(height: 1, color: DesignSystem.textGrey.withOpacity(0.1)),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_rounded,
                      size: 16,
                      color: DesignSystem.textGrey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      DateFormat('EEEE, d MMM').format(booking.date),
                      style: DesignSystem.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 16,
                      color: DesignSystem.textGrey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      booking.time,
                      style: DesignSystem.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
