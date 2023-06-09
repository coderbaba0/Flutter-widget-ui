import 'package:flutter/material.dart';

class DotIndicator2 extends StatelessWidget {
  const DotIndicator2({
    Key? key,
    required this.isActive,
    required this.index,
  }) : super(key: key);

  final bool isActive;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: isActive
          ? 4
          : (!isActive && index == 0)
              ? 3
              : 2,
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        duration: const Duration(
          milliseconds: 350,
        ),
        height: 5,
        decoration: BoxDecoration(
          color: isActive ? Colors.teal : Colors.grey,
          borderRadius: BorderRadius.circular(20),
          // shape: BoxShape.circle,
        ),
      ),
    );
  }
}
