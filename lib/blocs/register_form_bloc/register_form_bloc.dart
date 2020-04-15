import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:motivator/resources/user_repository.dart';
import 'package:provider/provider.dart';

class RegisterFormBloc extends FormBloc<String, String> {
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

  final confirmPassword = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  RegisterFormBloc(BuildContext context):
        this._userRepository = Provider.of<UserRepository>(context, listen: false){
    addFieldBlocs(
      fieldBlocs: [
        email,
        password,
        confirmPassword,
      ],
    );
    confirmPassword
      ..addValidators([FieldBlocValidators.confirmPassword(password)])
      ..subscribeToFieldBlocs([password]);
  }

  @override
  void onSubmitting() async {
    try {
      await _userRepository.signUp(email: email.value, password: password.value);
      emitSuccess();
    } catch (err) {
      emitFailure(failureResponse: err.toString());
    }
  }
}
