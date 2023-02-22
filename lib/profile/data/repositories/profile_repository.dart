import 'package:dartz/dartz.dart';

import '../../../../common/utils/failure.dart';
import '../../../features/authentication/data/models/user_model.dart';
import '../datasources/profile_local_data_source.dart';

class ProfileRepository {
  final ProfileLocalDataSource localDataSource;
  ProfileRepository({required this.localDataSource});

  Future<Either<Failure, UserModel>> fetchProfile() async {
    try {
      final response = await localDataSource.getProfile();
      return Right(response);
    } catch (err) {
      return Left(ServerException(message: err.toString()));
    }
  }
}
