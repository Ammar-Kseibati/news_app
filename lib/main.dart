import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_constance/theme_data.dart';
import 'package:news_app/presentation/screens/splash_screen.dart';

import 'core/services/services_locator.dart';

void main() {
  ServicesLocator().init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NEWS APP',
      theme: appThemeData(),
      home: const SplashScreen(),
    );
  }
}
