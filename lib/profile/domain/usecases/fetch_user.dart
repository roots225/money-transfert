import 'package:dartz/dartz.dart';

import '../../../../common/utils/failure.dart';
import '../../../features/authentication/data/models/user_model.dart';
import '../../data/repositories/profile_repository.dart';

class FetchUser {
  final ProfileRepository repository;
  FetchUser({required this.repository});

  Future<Either<Failure, UserModel>> call() async {
    return await repository.fetchProfile();
  }
}
