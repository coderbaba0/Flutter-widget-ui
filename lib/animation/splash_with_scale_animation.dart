import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)
            .drive(
      Tween<double>(begin: 0.0, end: 1.0),
    );
    _animationController.forward(from: 0);
    // _timer = Timer(
    //     const Duration(seconds: 4), () => Navigator.pushNamed(context, '/home'));
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF5A5A5A),
              Color(0xFFA8A8A8),
            ],
            stops: [
              0.0,
              1.0,
            ],
          ),
        ),
        child: Center(
          child: ScaleTransition(
            scale: _animation,
            child: const Text(
              'My Awesome App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
