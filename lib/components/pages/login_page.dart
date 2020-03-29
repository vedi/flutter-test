import 'package:flutter/material.dart';
import 'package:motivator/components/templates/app_page_template.dart';

const TITLE = 'Login';

class LoginPage extends StatelessWidget {
  final Function() onSignInWithGoogle;

  const LoginPage({
    Key key,
    @required this.onSignInWithGoogle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPageTemplate(
      title: TITLE,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text(
              'Sign in with Google',
            ),
            onPressed: onSignInWithGoogle,
          ),
        ],
      ),
    );
  }
}
