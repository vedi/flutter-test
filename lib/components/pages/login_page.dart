import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivator/blocs/login_form_bloc/login_form_bloc.dart';
import 'package:motivator/components/organisms/login_form.dart';
import 'package:motivator/components/templates/app_page_template.dart';

const TITLE = 'Login';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppPageTemplate(
      title: TITLE,
      body: BlocProvider<LoginFormBloc>(
        create: (context) => LoginFormBloc(context),
        child: LoginForm(),
      ),
    );
  }
}
