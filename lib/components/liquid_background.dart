import 'dart:math';
import 'package:flutter/material.dart';
import '../design_system.dart';

class LiquidBackground extends StatefulWidget {
  final Widget child;
  const LiquidBackground({super.key, required this.child});

  @override
  State<LiquidBackground> createState() => _LiquidBackgroundState();
}

class _LiquidBackgroundState extends State<LiquidBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _blobAnimation;

  @override
  void initState() {
    super.initState();
    // Use a slow, organic duration for the simulation
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat(reverse: true);

    _blobAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOutSine),
    );
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
          // Static soft gradient base
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

          // Isolated Animation Layer
          RepaintBoundary(
            child: AnimatedBuilder(
              animation: _blobAnimation,
              builder: (context, child) {
                return CustomPaint(
                  painter: _OrganicBlobPainter(
                    animationValue: _blobAnimation.value.clamp(0.0, 1.0),
                    primaryColor: DesignSystem.primary,
                    secondaryColor: DesignSystem.secondary,
                  ),
                  size: Size.infinite,
                  isComplex: true, // Hint for better caching
                  willChange: false, // Static composition
                );
              },
            ),
          ),

          // Content Layer
          SafeArea(child: widget.child),
        ],
      ),
    );
  }
}

class _OrganicBlobPainter extends CustomPainter {
  final double animationValue;
  final Color primaryColor;
  final Color secondaryColor;

  _OrganicBlobPainter({
    required this.animationValue,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Top Liquid Form
    final path1 = Path();
    final wave1 = sin(animationValue * pi * 2);

    path1.moveTo(0, 0);
    path1.lineTo(size.width, 0);
    path1.lineTo(size.width, size.height * 0.25 + wave1 * 20);

    // Organic curve generation
    path1.cubicTo(
      size.width * 0.75,
      size.height * 0.3 + wave1 * 40,
      size.width * 0.25,
      size.height * 0.2 - wave1 * 30,
      0,
      size.height * 0.25 + wave1 * 10,
    );
    path1.close();

    paint.color = primaryColor.withOpacity(0.08);
    canvas.drawPath(path1, paint);

    // Bottom Liquid Form
    final path2 = Path();
    final wave2 = cos(animationValue * pi * 2);

    path2.moveTo(0, size.height);
    path2.lineTo(size.width, size.height);
    path2.lineTo(size.width, size.height * 0.8 + wave2 * 30);

    path2.cubicTo(
      size.width * 0.6,
      size.height * 0.75 + wave2 * 50,
      size.width * 0.3,
      size.height * 0.85 - wave2 * 40,
      0,
      size.height * 0.8 + wave2 * 20,
    );
    path2.close();

    paint.color = secondaryColor.withOpacity(0.06);
    canvas.drawPath(path2, paint);

    // Floating subtle particles (bubbles)
    paint.color = primaryColor.withOpacity(0.04);
    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.2 + wave2 * 20),
      40 + wave1 * 10,
      paint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.15, size.height * 0.85 - wave1 * 15),
      60 + wave2 * 10,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _OrganicBlobPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
