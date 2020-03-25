import 'package:flutter/material.dart';
import 'package:motivator/api_helper.dart';
import 'package:motivator/app_drawer.dart';

const TITLE = 'Login';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  _handleSignInWithGoogle() async {
    ApiHelper.instance.loginWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TITLE),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                'Sign in with Google',
              ),
              onPressed: _handleSignInWithGoogle,
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
