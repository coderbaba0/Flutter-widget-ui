import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/theme_cubit.dart';

class ToggleThemeScreen extends StatelessWidget {
  const ToggleThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Toggle Theme',),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            themeCubit.toggleTheme();
          },
          child: const Text('Toggle Theme'),
        ),
      ),
    );
  }
}
