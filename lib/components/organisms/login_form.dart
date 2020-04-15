import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motivator/blocs/blocs.dart';
import 'package:motivator/blocs/login/login_form_bloc.dart';
import 'package:motivator/components/atoms/buttons.dart';

import '../../routes.dart';

class LoginForm extends StatefulWidget {
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginFormBloc _loginFormBloc;

  @override
  void initState() {
    super.initState();
    _loginFormBloc = BlocProvider.of<LoginFormBloc>(context);
  }


  @override
  Widget build(BuildContext context) {
    return FormBlocListener<LoginFormBloc, String, String>(
      onSubmitting: (context, state) {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Logging In...'),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
      },
      onSuccess: (context, state) {
        BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        BlocProvider.of<RouteBloc>(context).add(RouteReplaced(Routes.home));
      },
      onFailure: (context, state) {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Login Failure'), Icon(Icons.error)],
              ),
              backgroundColor: Colors.red,
            ),
          );
      },
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
              TextFieldBlocBuilder(
                textFieldBloc: _loginFormBloc.email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: 'Email',
                ),
              ),
              TextFieldBlocBuilder(
                textFieldBloc: _loginFormBloc.password,
                suffixButton: SuffixButton.obscureText,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Buttons.raised(
                      onPressed: _loginFormBloc.submit,
                      title: 'Login',
                    ),
                    Buttons.raisedIcon(
                      iconData: FontAwesomeIcons.google,
                      title: 'Sign in with Google',
                      onPressed: _loginFormBloc.submitWithGoogle,
                    ),
                    Buttons.flat(
                      title: 'Create an Account',
                      onPressed: () {
                        // TODO: Implement
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(builder: (context) {
                        //     return RegisterScreen(userRepository: _userRepository);
                        //   }),
                        // );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
