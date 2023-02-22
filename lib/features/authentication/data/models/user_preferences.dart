import 'package:shared_preferences/shared_preferences.dart';

import 'user_model.dart';

class UserPreferences {
  SharedPreferences sharedPreferences;
  UserPreferences({required this.sharedPreferences});

  Future<bool> saveUser(UserModel user,
      {required String password, required String token}) async {
    sharedPreferences.setString(UserPreferenceKeys.idKey, user.id ?? '');
    sharedPreferences.setString(UserPreferenceKeys.idKey, user.id ?? '');
    sharedPreferences.setString(UserPreferenceKeys.tokenKey, user.token ?? '');
    sharedPreferences.setString(UserPreferenceKeys.emailKey, user.email ?? "");
    sharedPreferences.setString(UserPreferenceKeys.phoneKey, user.phone ?? "");
    sharedPreferences.setString(UserPreferenceKeys.roleKey, user.role ?? "");
    sharedPreferences.setString(
        UserPreferenceKeys.lastNameKey, user.lastName ?? "");
    sharedPreferences.setString(
        UserPreferenceKeys.firstNameKey, user.firstName ?? "");
    sharedPreferences.setInt(UserPreferenceKeys.statusKey, user.status);
    sharedPreferences.setString(
        UserPreferenceKeys.codeCentreColKey, user.codeCentreCol ?? "");
    sharedPreferences.setString(UserPreferenceKeys.dateKey, user.date ?? "");

    return sharedPreferences.commit();
  }

  Future<void> updateUser(UserModel user) async {
    sharedPreferences.setString(UserPreferenceKeys.idKey, user.id ?? '');
    sharedPreferences.setString(UserPreferenceKeys.tokenKey, user.token ?? '');
    sharedPreferences.setString(UserPreferenceKeys.emailKey, user.email ?? "");
    sharedPreferences.setString(UserPreferenceKeys.phoneKey, user.phone ?? "");
    sharedPreferences.setString(UserPreferenceKeys.roleKey, user.role ?? "");
    sharedPreferences.setString(
        UserPreferenceKeys.lastNameKey, user.lastName ?? "");
    sharedPreferences.setString(
        UserPreferenceKeys.firstNameKey, user.firstName ?? "");
    sharedPreferences.setInt(UserPreferenceKeys.statusKey, user.status);
    sharedPreferences.setString(
        UserPreferenceKeys.codeCentreColKey, user.codeCentreCol ?? "");
    sharedPreferences.setString(UserPreferenceKeys.dateKey, user.date ?? "");

    sharedPreferences.reload();
  }

  UserModel getUser() {
    return UserModel(
      id: sharedPreferences.getString(UserPreferenceKeys.idKey),
      email: sharedPreferences.getString(UserPreferenceKeys.emailKey),
      phone: sharedPreferences.getString(UserPreferenceKeys.phoneKey),
      password: sharedPreferences.getString(UserPreferenceKeys.passwordKey),
      photo: sharedPreferences.getString(UserPreferenceKeys.photoKey) != ''
          ? sharedPreferences.getString(UserPreferenceKeys.photoKey)
          : null,
      token: sharedPreferences.getString(UserPreferenceKeys.tokenKey),
      role: sharedPreferences.getString(UserPreferenceKeys.roleKey),
      status: sharedPreferences.getInt(UserPreferenceKeys.statusKey) ?? 1,
      codeCentreCol:
          sharedPreferences.getString(UserPreferenceKeys.codeCentreColKey),
      date: sharedPreferences.getString(UserPreferenceKeys.dateKey),
    );
  }

  Future<void> updateAuthToken(String token) async {
    sharedPreferences.setString(UserPreferenceKeys.tokenKey, token);
    await sharedPreferences.reload();
  }

  String? getToken() {
    return sharedPreferences.getString("token");
  }

  Future<void> removeUser() async {
    for (String userKey in UserPreferenceKeys.allKeys) {
      await sharedPreferences.remove(userKey);
    }
  }

  void userTypeChoose(String value) {
    sharedPreferences.setString("userType", value);
  }

  String? userTypeChoosen() {
    return sharedPreferences.getString("userType");
  }

  bool isUserTypeChoosen() {
    return sharedPreferences.getString("userType") != null ? true : false;
  }

  void sliderSeen() {
    sharedPreferences.setBool("firstLoggin", true);
  }

  void initUserProfile() {
    sharedPreferences.setBool("haveProfile", true);
  }

  bool haveProfile() {
    return !(sharedPreferences.getBool("haveProfile") ?? false);
  }

  bool isFirstLoggin() {
    return !(sharedPreferences.getBool("firstLoggin") ?? false);
  }

  bool isUserLoggedIn() {
    final userDataFound = getUser().email != null &&
        getUser().id != null &&
        sharedPreferences.getString(UserPreferenceKeys.tokenKey) != null;
    return userDataFound;
  }
}

class UserPreferenceKeys {
  static const String idKey = "userId";
  static const String tokenKey = "token";
  static const String phoneKey = "userPhone";
  static const String lastNameKey = "userLastName";
  static const String firstNameKey = "userFirstName";
  static const String emailKey = "userEmail";
  static const String passwordKey = "userPassword";
  static const String photoKey = "userPhoto";
  static const String statusKey = "userStatus";
  static const String codeCentreColKey = "userCodeCentreCol";
  static const String roleKey = "userRole";
  static const String dateKey = "userDate";

  static List<String> allKeys = [
    idKey,
    tokenKey,
    emailKey,
    phoneKey,
    passwordKey,
    photoKey,
    roleKey,
    lastNameKey,
    firstNameKey,
    statusKey,
    codeCentreColKey,
    dateKey,
  ];
}
