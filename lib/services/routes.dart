import 'package:api_spotify_flutter/pages/detailplaylist.dart';
import 'package:flutter/material.dart';
import '../pages/homepage.dart';

class AppRoutes {
  late Map<String, WidgetBuilder> _routes;

  AppRoutes() {
    createRoutes();
  }

  void createRoutes() {
    _routes = {
      "/": (BuildContext context) => HomePage(),
      "second": (BuildContext context) => const Second(),
    };
  }

  get getRoutes => _routes;
}
