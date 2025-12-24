import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../design_system.dart';

class OrganicButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSecondary;
  final IconData? icon;

  const OrganicButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isSecondary = false,
    this.icon,
  });

  @override
  State<OrganicButton> createState() => _OrganicButtonState();
}

class _OrganicButtonState extends State<OrganicButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _controller.forward();
    HapticFeedback.lightImpact();
  }

  void _handleTapUp(TapUpDetails details) {
    _controller.reverse();
    HapticFeedback.selectionClick();
    widget.onTap();
  }

  void _handleTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                gradient: widget.isSecondary
                    ? null
                    : DesignSystem.primaryGradient,
                color: widget.isSecondary ? Colors.white : null,
                borderRadius: BorderRadius.circular(DesignSystem.radiusLarge),
                border: widget.isSecondary
                    ? Border.all(
                        color: DesignSystem.primary.withOpacity(0.3),
                        width: 1.5,
                      )
                    : null,
                boxShadow: [
                  BoxShadow(
                    color:
                        (widget.isSecondary
                                ? Colors.black
                                : DesignSystem.primary)
                            .withOpacity(widget.isSecondary ? 0.05 : 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                    spreadRadius: -5,
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Liquid shimmer effect could go here in a more advanced version
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.icon != null) ...[
                        Icon(
                          widget.icon,
                          color: widget.isSecondary
                              ? DesignSystem.primary
                              : Colors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                      ],
                      Text(
                        widget.text,
                        style: DesignSystem.buttonText.copyWith(
                          color: widget.isSecondary
                              ? DesignSystem.primary
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
