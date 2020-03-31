import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivator/blocs/blocs.dart';
import 'package:motivator/components/organisms/login_form.dart';
import 'package:motivator/components/templates/app_page_template.dart';

const TITLE = 'Login';

class LoginPage extends StatelessWidget {
  final Function() onSignInWithGoogle;

  const LoginPage({
    Key key,
    @required this.onSignInWithGoogle,
  }) : super(key: key);

  static withBloc() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
        return LoginPage(
          onSignInWithGoogle: () => loginBloc.add(LoginWithGooglePressed()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppPageTemplate(
      title: TITLE,
      body: LoginForm(),
    );
  }
}
