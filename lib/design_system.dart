import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Design System: Organic Liquid
///
/// This class acts as the single source of truth for the "Clinical Zen" aesthetic.
/// It defines wide-gamut colors, organic durations, and text styles.
class DesignSystem {
  DesignSystem._();

  // --- Clinical Zen Color Palette (Display P3 optimized) ---

  // Primary: A deep, calming teal representing medical precision.
  static const Color primary = Color(0xFF1A7F7A);

  // Secondary: A lighter, fluid teal for accents and liquid effects.
  static const Color secondary = Color(0xFF4DB6AC);

  // Zen White: Not pure white, but a soft, paper-like warm white for backgrounds.
  static const Color zenWhite = Color(0xFFF9F9F7);

  // Liquid Blue: A subtle, watery blue for shadows and deep backgrounds.
  static const Color liquidBlue = Color(0xFFE8F5F3);

  // Text Colors
  static const Color textDark = Color(0xFF2D3436);
  static const Color textGrey = Color(0xFF636E72);

  // Gradients
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

  // --- Organic Durations & Curves ---

  // Standard duration for "grown" UI expansions.
  static const Duration durationNormal = Duration(milliseconds: 400);
  static const Duration durationSlow = Duration(milliseconds: 800);

  // G2 Continuity simulation curve (approximated for UI).
  static const Curve curveOrganic = Curves.easeOutQuart;

  // --- Typography (Clean, Modern, Bespoke) ---

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

  // --- Shapes ---

  // Standard border radius for "Grown" shapes
  static const double radiusLarge = 32.0;
  static const double radiusMedium = 20.0;
  static const double radiusSmall = 12.0;
}
