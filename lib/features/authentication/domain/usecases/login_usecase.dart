import 'package:dartz/dartz.dart';

import '../../../../common/utils/failure.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/authentication_repository.dart';

class LoginUsecase {
  final AuthenticationRepository repository;
  LoginUsecase({required this.repository});

  Future<Either<Failure, UserModel>> call(LoginParams params) async {
    return await repository.login(params);
  }
}

class LoginParams {
  final String email;
  final String password;
  LoginParams({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
