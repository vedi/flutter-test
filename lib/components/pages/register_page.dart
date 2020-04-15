import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivator/blocs/register_form_bloc/register_form_bloc.dart';
import 'package:motivator/components/organisms/register_form.dart';
import 'package:motivator/components/templates/app_page_template.dart';

const TITLE = 'Register';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppPageTemplate(
      title: TITLE,
      body: BlocProvider<RegisterFormBloc>(
        create: (context) => RegisterFormBloc(context),
        child: RegisterForm(),
      ),
    );
  }
}
