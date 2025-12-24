import 'package:flutter/material.dart';
import '../model/booking.dart';

class BookingService extends ChangeNotifier {
  static final BookingService _instance = BookingService._internal();
  factory BookingService() => _instance;
  BookingService._internal();

  final List<Booking> _bookings = [];
  List<Booking> _upcomingBookings = [];
  List<Booking> _pastBookings = [];

  List<Booking> get bookings => List.unmodifiable(_bookings);
  List<Booking> get upcomingBookings => List.unmodifiable(_upcomingBookings);
  List<Booking> get pastBookings => List.unmodifiable(_pastBookings);

  void addBooking(Booking booking) {
    _bookings.add(booking);
    _updateCache();
    notifyListeners();
  }

  void _updateCache() {
    _upcomingBookings =
        _bookings.where((b) => b.status == BookingStatus.upcoming).toList();
    _pastBookings = _bookings
        .where((b) =>
            b.status == BookingStatus.completed ||
            b.status == BookingStatus.cancelled)
        .toList();
  }
}
