
import 'package:flutter/material.dart';
import 'package:movies_app/core/components/reuseable_components.dart';
import 'package:movies_app/features/home/presentation/pages/home_screen.dart';

class AppRoutesName {
  static const String home = "/";
}


class AppRoute {

  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.home:
        return MaterialPageRoute(builder: (context) =>    HomeScreen(),);

      default:
        return MaterialPageRoute(builder: (context) => unDefineRoute(),);
    }
  }
}