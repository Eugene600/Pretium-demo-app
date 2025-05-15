// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class AnimatedImage extends StatefulWidget {
//   final String imagePath;
//   final int index;

//   const AnimatedImage({
//     super.key,
//     required this.imagePath,
//     required this.index,
//   });

//   @override
//   State<AnimatedImage> createState() => _AnimatedImageState();
// }

// class _AnimatedImageState extends State<AnimatedImage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );

//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeIn),
//     );

//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0.0, 0.2),
//       end: Offset.zero,
//     ).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeOut),
//     );

//     _controller.forward();
//   }

//   @override
//   void didUpdateWidget(covariant AnimatedImage oldWidget) {
//     if (oldWidget.index != widget.index) {
//       _controller.reset();
//       _controller.forward();
//     }
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FadeTransition(
//       opacity: _fadeAnimation,
//       child: SlideTransition(
//         position: _slideAnimation,
//         child: Hero(
//           tag: '${widget.index}',
//           child: SvgPicture.asset(
//             widget.imagePath,
//             height: 250,
//             width: 250,
//             fit: BoxFit.contain,
//           ),
//         ),
//       ),
//     );
//   }
// }
