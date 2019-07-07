import 'package:flutter/material.dart';
import 'package:shopapp/Pages/ProductDetails.dart';

import 'package:shopapp/Pages/HomeScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case '/products':
        return MaterialPageRoute(builder: (_) => ProductDetails());
    }
  }
}
