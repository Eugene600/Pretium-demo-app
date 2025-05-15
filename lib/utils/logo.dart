import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final Color? color;
  const AppLogo({super.key, this.size = 100, this.color});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logos/pretium_finance_logo-removebg-preview.png',
      width: size,
      height: size,
      color: color,
    );
  }
}
