import 'dart:ui';
import 'package:flutter/material.dart';
import '../design_system.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final List<Color>? gradientColors;
  final BorderRadiusGeometry? borderRadius;

  /// Set to false in scrolling lists to disable expensive BackdropFilter blur.
  /// This significantly improves scroll performance on Android devices.
  final bool blurEnabled;

  const GlassCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(20),
    this.gradientColors,
    this.borderRadius,
    this.blurEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius =
        borderRadius ?? BorderRadius.circular(DesignSystem.radiusLarge);

    final containerDecoration = BoxDecoration(
      // Use higher opacity when blur is disabled for better readability
      color: Colors.white.withOpacity(blurEnabled ? 0.6 : 0.92),
      borderRadius: effectiveBorderRadius,
      border: Border.all(
        color: Colors.white.withOpacity(blurEnabled ? 0.6 : 0.8),
        width: 1.5,
      ),
      gradient: gradientColors != null
          ? LinearGradient(
              colors: gradientColors!,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          : (blurEnabled
                ? DesignSystem.glassGradient
                : DesignSystem.solidCardGradient),
      boxShadow: [
        BoxShadow(
          color: DesignSystem.primary.withOpacity(0.05),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    );

    Widget content;

    if (blurEnabled) {
      // Full glass effect with expensive BackdropFilter - use for static elements
      content = ClipRRect(
        borderRadius: effectiveBorderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: padding,
            decoration: containerDecoration,
            child: child,
          ),
        ),
      );
    } else {
      // Performant solid card - use in scrolling lists
      content = Container(
        padding: padding,
        decoration: containerDecoration,
        child: child,
      );
    }

    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: content);
    }

    return content;
  }
}
