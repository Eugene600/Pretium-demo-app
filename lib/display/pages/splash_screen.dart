import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pretium/app_preference/providers/app_preference_providers.dart';
import 'package:pretium/navigation/route_names.dart';
import 'package:pretium/utils/logo.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      final result = await ref.read(isFirstTimeProvider.future);

      if (!mounted) return;

      if (result) {
        context.goNamed(RouteNames.landingPage);
      } else {
        context.goNamed(RouteNames.loginScreen);
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00796B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLogo(size: 400,),
          ],
        ),
      ),
    );
  }
}