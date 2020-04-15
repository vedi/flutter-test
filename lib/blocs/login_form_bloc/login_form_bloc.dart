import 'package:flutter/widgets.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:motivator/resources/user_repository.dart';
import 'package:provider/provider.dart';

import 'login_form_event.dart';
export 'login_form_event.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final UserRepository _userRepository;

  final email = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
  );

  final password = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  LoginFormBloc(BuildContext context):
        this._userRepository = Provider.of<UserRepository>(context, listen: false){
    addFieldBlocs(
      fieldBlocs: [
        email,
        password,
      ],
    );
  }

  void submitWithGoogle() => add(LoginWithGooglePressed());

  @override
  Stream<FormBlocState<String, String>> mapEventToState(FormBlocEvent event) async* {
    if (event is LoginWithGooglePressed) {
      print('LoginWithGooglePressed');
      await _userRepository.signInWithGoogle();
    } else {
      yield* super.mapEventToState(event);
    }
  }

  @override
  void onSubmitting() async {
    try {
      await _userRepository.signInWithCredentials(email.value, password.value);
      emitSuccess();
    } catch (err) {
      emitFailure(failureResponse: err.toString());
    }
  }
}
