import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CurvedNavigationScreen extends StatefulWidget {
  const CurvedNavigationScreen({Key? key}) : super(key: key);

  @override
  State<CurvedNavigationScreen> createState() => _CurvedNavigationScreenState();
}

class _CurvedNavigationScreenState extends State<CurvedNavigationScreen> {
  List<Widget> items = const [
    Icon(Icons.list, size: 30),
    Icon(Icons.favorite, size: 30),
    Icon(Icons.home, size: 30),
    Icon(Icons.search, size: 30),
    Icon(Icons.settings, size: 30),
  ];

  int index = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Image.network(
        'https://media.istockphoto.com/id/1409948376/photo/man-doing-contemporary-modern-dance-move.jpg?s=612x612&w=is&k=20&c=33QG7NL1r11ajtnCe691fTLn6yN-ewigaN6LX8ieN4M=',
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        child: CurvedNavigationBar(
          height: 60,
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          color: Colors.teal.withOpacity(.6),
          buttonBackgroundColor: Colors.teal,
          items: items,
          index: index,
        ),
      ),
    );
  }
}
