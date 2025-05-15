import 'package:flutter/material.dart';

class RotatingIcon extends StatefulWidget {
  const RotatingIcon({super.key});

  @override
  State<RotatingIcon> createState() => RotatingIconState();
}

class RotatingIconState extends State<RotatingIcon> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: const Icon(Icons.info_outline_rounded, color: Colors.white),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
