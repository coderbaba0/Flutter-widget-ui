import 'package:flutter/material.dart';

class SliverGridWidget extends StatelessWidget {
  const SliverGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GridView.builder(
        padding: const EdgeInsets.all(20),
        primary: false,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Image.network(
            'https://images.pexels.com/photos/16106135/pexels-photo-16106135.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            height: 100,
            fit: BoxFit.cover,
          );
        },
        itemCount: 20,
      ),
    );
  }
}
