import 'package:flutter/material.dart';
import 'package:flutter_ui_source/sliver_grid.dart';

class BasicSliverAppBar extends StatelessWidget {
  const BasicSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.amber,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ],
            expandedHeight: 250,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Basic Sliver',
              ),
              centerTitle: true,
              background: Image.network(
                'https://images.pexels.com/photos/4126318/pexels-photo-4126318.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                fit: BoxFit.cover,
              ),
              collapseMode: CollapseMode.pin,
            ),
          ),
          const SliverGridWidget(),
        ],
      ),
    );
  }
}
