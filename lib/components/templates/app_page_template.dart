import 'package:flutter/material.dart';
import 'package:motivator/components/organisms/app_drawer.dart';
import 'package:motivator/containers/app_drawer_container.dart';

class AppPageTemplate extends StatelessWidget {
  @required
  final String title;

  @required
  final Widget body;

  final FloatingActionButton floatingActionButton;

  const AppPageTemplate({
    Key key,
    this.title,
    this.body,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: body,
      ),
      drawer: AppDrawerContainer(),
      floatingActionButton: floatingActionButton,
    );
  }
}
