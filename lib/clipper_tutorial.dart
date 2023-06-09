import 'package:flutter/material.dart';
import 'package:flutter_ui_source/custom_clipper.dart';

class ClipperTutorial extends StatelessWidget {
  const ClipperTutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        //title: const Text('Clipper Tutorial'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ClipPath(
              clipper: MyCustomClipper(),
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            child: ClipPath(
              clipper: MyCustomClipper2(),
              child: Container(
                color: Colors.teal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
