import 'package:flutter/material.dart';
import '../../../../common/utils/failure.dart';
import '../../data/models/user_model.dart';
import '../../data/models/user_preferences.dart';
import '../../domain/usecases/login_usecase.dart';

enum AuthenticationLoadingState {
  initial,
  signin,
  loginFailed,
  signinWithSocialNetwork,
  registering,
  phoneVerification,
  finished,
  userProfile,
  resetingPassword,
  loginOut,
  logout
}

class AuthenticationProvider extends ChangeNotifier {
  AuthenticationLoadingState loadingState = AuthenticationLoadingState.initial;
  LoginUsecase loginUsecase;

  UserPreferences userPreferences;

  /// Initial values of provider
  Failure? error;
  UserModel? user;

  AuthenticationProvider(
      {required this.loginUsecase, required this.userPreferences}) {
    error = null;
  }

  Future<void> processSignin(LoginParams params) async {
    error = null;
    loadingState = AuthenticationLoadingState.signin;
    notifyListeners();

    final response = await loginUsecase(params);
    response.fold((l) {
      error = l;
      loadingState = AuthenticationLoadingState.loginFailed;
    }, (r) {
      user = r;
      loadingState = AuthenticationLoadingState.finished;
    });
    notifyListeners();
  }
}
