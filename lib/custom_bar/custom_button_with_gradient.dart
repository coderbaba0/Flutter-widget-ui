import 'package:flutter/material.dart';

class CustomButtonWithGradient extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final double radius;
  final VoidCallback onPressed;

  const CustomButtonWithGradient({
    Key? key,
    required this.child,
    this.radius = 0.0,
    required this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(radius),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey[500]!,
        //     offset: const Offset(0.0, 1.5),
        //     blurRadius: 1.5,
        //   ),
        // ],
      ),
      child: Material(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        color: Colors.transparent,
        child: GestureDetector(
          onTap: onPressed,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
