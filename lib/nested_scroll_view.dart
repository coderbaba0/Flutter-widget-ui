import 'package:flutter/material.dart';

class NestedScrollViewExample extends StatelessWidget {
  const NestedScrollViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, val) {
            return [
              const SliverAppBar(
                backgroundColor: Colors.teal,
                floating: true,
                pinned: true,

                bottom: TabBar(
                  tabs: [
                    Tab(
                      text: 'tab 1',
                      icon: Icon(Icons.add_a_photo_sharp),
                    ),
                    Tab(
                      text: 'tab 2',
                      icon: Icon(Icons.map),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              GridView.builder(
                padding: const EdgeInsets.all(5),
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
              GridView.builder(
                padding: const EdgeInsets.all(5),
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
            ],
          ),
        ),
      ),
    );
  }
}
