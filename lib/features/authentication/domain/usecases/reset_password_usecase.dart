import 'package:dartz/dartz.dart';

import '../../../../common/utils/failure.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/authentication_repository.dart';

class ResetPasswordUsecase {
  final AuthenticationRepository repository;
  ResetPasswordUsecase({required this.repository});

  Future<Either<Failure, bool>> attempt(String email) async {
    throw UnimplementedError();
    // return await repository.attemptResetPasswordForEmail(email);
  }

  Future<Either<Failure, UserModel>> established() async {
    throw UnimplementedError();
    // return await repository.establishedResetPasswordForEmail(session);
  }
}
