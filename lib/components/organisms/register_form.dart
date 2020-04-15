import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:motivator/blocs/blocs.dart';
import 'package:motivator/blocs/register_form_bloc/register_form_bloc.dart';
import 'package:motivator/components/atoms/buttons.dart';

import '../../routes.dart';

class RegisterForm extends StatefulWidget {
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  RegisterFormBloc _registerFormBloc;

  @override
  void initState() {
    super.initState();
    _registerFormBloc = BlocProvider.of<RegisterFormBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return FormBlocListener<RegisterFormBloc, String, String>(
      onSubmitting: (context, state) {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Registering...'),
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
                children: [
                  Text('Registration Failure: ${state.failureResponse}'),
                  Icon(Icons.error),
                ],
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
                textFieldBloc: _registerFormBloc.email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: 'Email',
                ),
              ),
              TextFieldBlocBuilder(
                textFieldBloc: _registerFormBloc.password,
                suffixButton: SuffixButton.obscureText,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
              ),
              TextFieldBlocBuilder(
                textFieldBloc: _registerFormBloc.confirmPassword,
                suffixButton: SuffixButton.obscureText,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock_outline),
                  labelText: 'Confirm Password',
                ),
              ),
              Buttons.raised(
                onPressed: _registerFormBloc.submit,
                title: 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
