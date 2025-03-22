import 'package:flutter/material.dart';
import 'package:kgk_diamonds/screens/cart_page.dart';
import 'package:kgk_diamonds/screens/filter_page.dart';
import 'package:kgk_diamonds/screens/result_page.dart';

class AppRoutes {
  static const String filterPage = '/';
  static const String resultPage = '/results';
  static const String cartPage = '/cart';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case filterPage:
        return MaterialPageRoute(builder: (_) => FilterPage());
      case resultPage:
        return MaterialPageRoute(builder: (_) => ResultPage());
      case cartPage:
        return MaterialPageRoute(builder: (_) => CartPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
