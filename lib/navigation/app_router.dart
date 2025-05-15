import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pretium/auth/pages/forgot_password.dart';
import 'package:pretium/auth/pages/login.dart';
import 'package:pretium/auth/pages/register.dart';
import 'package:pretium/display/pages/landing_page.dart';
import 'package:pretium/display/pages/splash_screen.dart';
import 'package:pretium/navigation/route_names.dart';

final routesProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier();
  return GoRouter(
    initialLocation: '/', //the splash screen is the first screen to be loaded while the app launches
    refreshListenable: router,
    routes: router.routes,
  );
});

class RouterNotifier extends ChangeNotifier {
  List<RouteBase> get routes => [
    GoRoute(
      path: '/',
      name: RouteNames.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/landing-page',
      name: RouteNames.landingPage,
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
      path: '/login',
      name: RouteNames.loginScreen,
      builder: (context, state) => const Login(),
      routes: [
        GoRoute(
          path: '/register',
          name: RouteNames.registrationScreen,
          builder: (context, state) => Registration(),
        ),
        GoRoute(
          path: '/forgot-password',
          name: RouteNames.forgotPassword,
          builder: (context, state) => ForgotPassword(),
        ),
      ],
    ),
  ];
}
