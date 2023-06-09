import 'package:flutter/material.dart';

class StackTutorial extends StatelessWidget {
  const StackTutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Stack Tutorial',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 200,
            color: Colors.teal,
          ),
          Positioned(
            bottom: -30,
            left: 0,
            right: 0,
            child: Container(
              width: 100,
              height: 100,
              decoration:  const BoxDecoration(
                  color: Colors.tealAccent,
                  gradient: LinearGradient(
                    colors: [
                      Colors.red,
                      Colors.yellow,
                    ],
                    end: Alignment.centerLeft,
                    begin: Alignment.centerRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.greenAccent,
                      spreadRadius: 100,
                      blurRadius: 0,
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
