enum BookingStatus { upcoming, completed, cancelled }

class Booking {
  final String id;
  final int doctorId;
  final DateTime date;
  final String time;
  BookingStatus status;
  final int queueNumber;

  Booking({
    required this.id,
    required this.doctorId,
    required this.date,
    required this.time,
    required this.status,
    required this.queueNumber,
  });
}
