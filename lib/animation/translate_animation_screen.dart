import 'dart:async';
import 'package:flutter/material.dart';

class TranslateAnimationScreen extends StatefulWidget {
  const TranslateAnimationScreen({Key? key}) : super(key: key);

  @override
  _TranslateAnimationScreenState createState() =>
      _TranslateAnimationScreenState();
}

class _TranslateAnimationScreenState extends State<TranslateAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _animation = Tween<double>(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _animationController.forward();
    // _timer = Timer(const Duration(seconds: 4),
    //     () => Navigator.pushNamed(context, '/home'));
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
          child: AnimatedBuilder(
            animation: _animation,
            builder: (BuildContext context, Widget? child) {
              return Transform.translate(
                offset: Offset(
                  0.0,
                  _animation.value * (MediaQuery.of(context).size.width / 2),
                ),
                child: child,
              );
            },
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
