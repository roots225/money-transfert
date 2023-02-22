import 'package:flutter/material.dart';

import '../../../../common/utils/failure.dart';
import '../../../features/authentication/data/models/user_model.dart';
import '../../../features/authentication/data/models/user_preferences.dart';
import '../../domain/usecases/fetch_user.dart';

enum ProfileProviderLoadingState {
  initial,
  loading,
  finished,
  error,
  loginOut,
  logout
}

class ProfileProvider extends ChangeNotifier {
  FetchUser fetchUserUsecase;
  ProfileProviderLoadingState loadingState =
      ProfileProviderLoadingState.initial;
  UserModel? user;
  Failure? error;
  UserPreferences preferences;

  ProfileProvider({required this.fetchUserUsecase, required this.preferences});

  Future<void> getProfile() async {
    loadingState = ProfileProviderLoadingState.loading;
    notifyListeners();

    final response = await fetchUserUsecase();
    response.fold((l) {
      error = l;
      loadingState = ProfileProviderLoadingState.error;
    }, (r) {
      user = r;
      print(user?.toJson());
      loadingState = ProfileProviderLoadingState.finished;
    });
    notifyListeners();
  }

  Future<void> logout() async {
    error = null;
    loadingState = ProfileProviderLoadingState.loginOut;
    notifyListeners();

    await preferences.removeUser();

    loadingState = ProfileProviderLoadingState.logout;
    notifyListeners();
  }
}
