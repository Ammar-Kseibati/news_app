import 'dart:async';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:news_app/core/utils/app_constance/app_constance.dart';
import 'package:news_app/presentation/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool textAinmate = false;
  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    Future.delayed(const Duration(seconds: 3), () {
      textAinmate = true;
      setState(() {});
    });
    _controller.addListener(() {
      if (_controller.value == 1.0) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        _controller.stop();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff2C3E50),
            Colors.black,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            controller: _controller,
            onLoaded: (animation) {
              _controller
                ..duration = animation.duration
                ..forward();
            },
            'assets/lottie/splash_image.json',
            height: AppFunction.hieght(context) * 0.3,
            width: AppFunction.width(context) * 0.7,
            filterQuality: FilterQuality.medium,
          ),
          AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: textAinmate ? 1 : 0,
            child: Text(
              AppString.splashText,
              style: Theme.of(context).textTheme.headline1,
            ),
          )
        ],
      ),
    ));
  }
}
