import 'package:flutter/material.dart';
import 'package:flutter_ui_source/splash_animation/welcome_screen.dart';

import 'jumping_dot.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;

  // Animation

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 4),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        ),
      ),
    );
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..forward();
    animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Curves.easeInOutQuad,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8664A3),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            // FadeTransition(
            //   opacity: animation!,
            //   child: const Text(
            //     'Mandobk',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontWeight: FontWeight.w800,
            //       fontSize: 40,
            //     ),
            //   ),
            // ),
            // ScaleTransition(
            //   scale: animation!,
            //   child: const Text(
            //     'Mandobk',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontWeight: FontWeight.w800,
            //       fontSize: 40,
            //     ),
            //   ),
            // ),
            AnimatedBuilder(
              builder: (context, child) {
                return child!;
              },
              animation: animation!,
              // padding: EdgeInsets.only(top: animation!.value * 200),
              // duration: const Duration(seconds: 10),
              child: AnimatedPadding(
                padding: EdgeInsets.only(
                  top: animation!.value,
                ),
                duration: const Duration(seconds: 6),
                child: const Text(
                  'Mandobk',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Center(
                child: JumpingDots(
                  color: Colors.white,
                  radius: 13,
                  numberOfDots: 4,
                  animationDuration: const Duration(milliseconds: 80),
                  verticalOffset: 10,
                  innerPadding: 1,
                  delay: 80,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
