import 'package:flutter/material.dart';
import 'package:motivator/components/organisms/app_drawer.dart';
import 'package:motivator/components/templates/app_page_template.dart';

const TITLE = 'Teams Page';

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppPageTemplate(
      title: TITLE,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Teams'),
        ],
      ),
    );
  }
}
