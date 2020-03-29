import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:motivator/routes.dart';

class AppDrawer extends StatelessWidget {
  final String userName;
  final Function() onLogout;
  final Function(String route) onNavigate;

  const AppDrawer({
    Key key,
    @required this.userName,
    @required this.onLogout,
    @required this.onNavigate,
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
                  userName ?? '<unknown user>',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          _buildRouteListTile(context, 'Home', Routes.home),
          _buildRouteListTile(context, 'Teams', Routes.teams),
          if (userName == null) _buildRouteListTile(context, 'Login', Routes.login),
          if (userName != null) _buildListTile(context, 'Logout', onLogout),
        ],
      ),
    );
  }

  ListTile _buildRouteListTile(BuildContext context, String title, String route) {
    return _buildListTile(context, title, () {
      onNavigate(route);
    });
  }

  ListTile _buildListTile(BuildContext context, String title, Function() onTap) {
    return ListTile(
      title: Text(title),
      onTap: () {
        onTap();
        _hideDrawer(context);
      },
    );
  }

  _hideDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }
}
