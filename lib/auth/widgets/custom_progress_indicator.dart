import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatefulWidget {
  final Duration duration;

  const CustomProgressIndicator({super.key, required this.duration});

  @override
  _CustomProgressIndicatorState createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _progressAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: LinearProgressIndicator(
            value: _progressAnimation.value,
            backgroundColor: Colors.white24,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
