import 'package:flutter/material.dart';
import '../design_system.dart';

class OrganicTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final Widget? suffixIcon;

  const OrganicTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(DesignSystem.radiusMedium),
        boxShadow: [
          BoxShadow(
            color: DesignSystem.primary.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: DesignSystem.bodyMedium.copyWith(color: DesignSystem.textDark),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: DesignSystem.bodyMedium.copyWith(
            color: DesignSystem.textGrey.withOpacity(0.5),
          ),
          prefixIcon: Icon(icon, color: DesignSystem.primary.withOpacity(0.8)),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DesignSystem.radiusMedium),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DesignSystem.radiusMedium),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DesignSystem.radiusMedium),
            borderSide: BorderSide(
              color: DesignSystem.secondary.withOpacity(0.5),
              width: 1.5,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
        ),
      ),
    );
  }
}
