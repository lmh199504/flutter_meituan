import 'package:flutter/material.dart';
import 'package:flutter_zuiyou/pages/homePage/index.dart';

final routes = {
  '/': (context) => HomePage(),
};

// ignore: top_level_function_literal_block, missing_return
var onGenerateRoute = (RouteSettings settings) {
  //统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
