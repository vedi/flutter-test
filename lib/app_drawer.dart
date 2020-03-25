import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: <Widget>[
                Text(
                  'Motivator',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  'User',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          _buildRouteListTile(context, 'Home', '/'),
          _buildRouteListTile(context, 'Teams', '/teams'),
          _buildRouteListTile(context, 'Login', '/login'),
        ],
      ),
    );
  }

  ListTile _buildRouteListTile(BuildContext context, String title, String route) {
    return ListTile(
          title: Text(title),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(
                context,
                route,
            );
          },
        );
  }
}
