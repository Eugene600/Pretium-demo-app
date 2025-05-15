import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretium/navigation/app_router.dart';

class Pretium extends StatelessWidget {
  const Pretium({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final router = ref.watch(routesProvider);
        return MaterialApp.router(
          title: 'Pretium',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xFF00796B),
              brightness: Brightness.light,
            ),
            useMaterial3: true,
          ),
          /*use of Material3 to allow application to adjust theme 
          based on user's device theme 
          while still maintaining application's theme
          */
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xFF00796B),
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
