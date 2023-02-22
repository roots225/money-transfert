import '../../../../common/network/network_request.dart';
import '../../../../common/network/network_service.dart';
import '../../domain/usecases/login_usecase.dart';
import '../models/user_model.dart';
import '../models/user_preferences.dart';

class AuthenticationRemoteDataSource {
  UserPreferences preferences;
  NetworkService networkService;
  AuthenticationRemoteDataSource(
      {required this.networkService, required this.preferences});

  Future<UserModel> login(LoginParams params) async {
    final request = NetworkRequest(
        path: "/login", method: NetworkMethod.Post, body: params.toJson());
    final response = await networkService.fetchRequest(request);
    final data = response["data"];

    final token = data["token"];
    final user = UserModel.fromJson(data["user"]);
    // Save user data to local storage
    await preferences.saveUser(user, password: params.password, token: token);
    await preferences.updateAuthToken(token);
    return user;
  }
}
