import 'package:dartz/dartz.dart';

import '../../../../common/utils/failure.dart';
import '../../domain/usecases/login_usecase.dart';
import '../datasources/authentication_remote_data_source.dart';
import '../models/user_model.dart';

class AuthenticationRepository {
  final AuthenticationRemoteDataSource dataSource;

  AuthenticationRepository({required this.dataSource});

  Future<Either<Failure, UserModel>> login(LoginParams params) async {
    try {
      final response = await dataSource.login(params);
      return Right(response);
    } on ServerException catch (error) {
      return Left(error);
    } catch (error) {
      return Left(ServerException(message: error.toString()));
    }
  }

  // Future<Either<Failure, UserModel>> logout(UserModel params) async {
  //   try {
  //     final response = await dataSource.logout(params);
  //     return Right(response);
  //   } catch (error) {
  //     return Left(ServerException(message: error.toString()));
  //   }
  // }
}
