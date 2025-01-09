import 'package:flutter/material.dart';
import 'package:vakinha_app/core/ui/styles/app_theme.dart';
import 'package:vakinha_app/pages/splash/splash_page.dart';

class VakinhaApp extends StatelessWidget {
  const VakinhaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vakinha App',
      theme: AppTheme.themeData,
      routes: {
        '/': (context) => const SplashPage(),
      },
    );
  }
}
