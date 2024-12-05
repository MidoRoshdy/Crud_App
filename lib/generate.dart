import 'package:crud_app/add.dart';
import 'package:crud_app/edit.dart';
import 'package:crud_app/getall.dart';
import 'package:crud_app/getpost.dart';
import 'package:crud_app/homescreen.dart';
import 'package:crud_app/routesname.dart';
import 'package:flutter/material.dart';

// import 'package:lib/routesname.dart';

class AppRoute {
  static Route<dynamic> generate(RouteSettings? settings) {
    switch (settings?.name) {
      case RoutesName.getall:
        return MaterialPageRoute(builder: (_) {
          return const Getall();
        });
      case RoutesName.homescreen:
        return MaterialPageRoute(builder: (_) {
          return const Homescreen();
        });
      case RoutesName.addd:
        return MaterialPageRoute(builder: (_) {
          return const Add();
        });
      case RoutesName.get:
        final args = settings!.arguments as int;
        return MaterialPageRoute(builder: (_) {
          return Getpost(
            id: args,
          );
        });
      case RoutesName.updatee:
        final args = settings!.arguments as int;
        return MaterialPageRoute(builder: (_) {
          return Edit(
            id: args,
          );
        });

//
      default:
        throw Exception('Route not found!');
    }
  }
}
