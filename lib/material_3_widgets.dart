import 'package:flutter/material.dart';

class Material3Widgets extends StatelessWidget {
  const Material3Widgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material3'),
      ),
      body: ListView(
        children: const [
          Chip(
            label: Text('chip'),
          ),
        ],
      ),
    );
  }
}
