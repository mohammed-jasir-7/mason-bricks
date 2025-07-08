

import 'package:flutter/material.dart';

class RouteGenerator {
  static String? route;
  RouteGenerator() ;
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    
  }
}

Route _rightToLeft(Widget widget, String? name) {
  return PageRouteBuilder(
    settings: RouteSettings(name: name),
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      // Optimize Tween creation
    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    final offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
    },
  );
}
