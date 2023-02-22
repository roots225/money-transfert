import '../../../features/authentication/data/models/user_model.dart';
import '../../../features/authentication/data/models/user_preferences.dart';

class ProfileLocalDataSource {
  final UserPreferences preferences;
  ProfileLocalDataSource({required this.preferences});

  Future<UserModel> getProfile() async {
    // final profileBox = objectbox.store.box<UserModel>();
    // UserModel user = profileBox.get()
    UserModel user = preferences.getUser();
    return user;
  }
}
