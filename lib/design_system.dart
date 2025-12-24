import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesignSystem {
  DesignSystem._();
  static const Color primary = Color(0xFF1A7F7A);
  static const Color secondary = Color(0xFF4DB6AC);
  static const Color zenWhite = Color(0xFFF9F9F7);
  static const Color liquidBlue = Color(0xFFE8F5F3);
  static const Color textDark = Color(0xFF2D3436);
  static const Color textGrey = Color(0xFF636E72);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient glassGradient = LinearGradient(
    colors: [Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.5)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Duration durationNormal = Duration(milliseconds: 400);
  static const Duration durationSlow = Duration(milliseconds: 800);

  static const Curve curveOrganic = Curves.easeOutQuart;

  static final TextStyle titleLarge = GoogleFonts.outfit(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: textDark,
    letterSpacing: -0.5,
  );

  static final TextStyle titleMedium = GoogleFonts.outfit(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: textDark,
  );

  static final TextStyle bodyMedium = GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: textGrey,
    height: 1.5,
  );

  static final TextStyle buttonText = GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.5,
  );

  static const double radiusLarge = 32.0;
  static const double radiusMedium = 20.0;
  static const double radiusSmall = 12.0;

  // --- Navigation ---

  static Route createRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(
        milliseconds: 350,
      ), // Reduced for snappier feel
      reverseTransitionDuration: const Duration(
        milliseconds: 250,
      ), // Faster back navigation
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.05, 0.0);
        const end = Offset.zero;
        const curve = curveOrganic;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        var fadeAnimation = CurvedAnimation(parent: animation, curve: curve);

        return FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(position: offsetAnimation, child: child),
        );
      },
    );
  }
}
