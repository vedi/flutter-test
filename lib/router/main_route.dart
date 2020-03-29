import 'package:flutter/material.dart';

import 'route_observer.dart';

class MainRoute<T> extends MaterialPageRoute<T> {
  MainRoute(Widget widget, {RouteSettings settings})
      : super(
      builder: (_) => RouteAwareWidget(child: widget),
      settings: settings);
}
