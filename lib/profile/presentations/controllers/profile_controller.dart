import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../../../features/authentication/data/models/user_model.dart';

class ProfileController extends FxController {
  bool showLoading = true, uiLoading = true;
  bool notification = true, offlineReading = false;
  late UserModel user;

  @override
  initState() {
    super.initState();

    fetchData();
  }

  void fetchData() async {
    user = UserModel();
    await Future.delayed(Duration(seconds: 1));

    showLoading = false;
    uiLoading = false;
    update();
  }

  void logout() {
    Navigator.pop(context);
  }

  @override
  String getTag() {
    return "profile_controller";
  }
}
