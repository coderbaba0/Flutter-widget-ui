import 'package:flutter/material.dart';
import 'package:flutter_ui_source/default_screen.dart';
import 'package:flutter_ui_source/first_screen.dart';

class AppRouter extends Route {
 static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/firstScreen':
        return MaterialPageRoute(builder: (context) => const FirstScreen());
      default:
        return MaterialPageRoute(builder: (context) => const DefaultScreen());
    }
  }
}
