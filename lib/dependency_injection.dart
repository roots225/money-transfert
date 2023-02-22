import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/network/network_service.dart';
import 'features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'features/authentication/data/models/user_preferences.dart';
import 'features/authentication/data/repositories/authentication_repository.dart';
import 'features/authentication/domain/usecases/login_usecase.dart';
import 'profile/data/datasources/profile_local_data_source.dart';
import 'profile/data/repositories/profile_repository.dart';
import 'profile/domain/usecases/fetch_user.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  /// Authentication dependecies
  sl.registerFactory<AuthenticationRemoteDataSource>(() =>
      AuthenticationRemoteDataSource(networkService: sl(), preferences: sl()));
  sl.registerFactory<AuthenticationRepository>(
      () => AuthenticationRepository(dataSource: sl()));
  sl.registerFactory<LoginUsecase>(() => LoginUsecase(repository: sl()));

  /// Profile dependencies

  sl.registerFactory<ProfileLocalDataSource>(
      () => ProfileLocalDataSource(preferences: sl()));
  sl.registerFactory<ProfileRepository>(
      () => ProfileRepository(localDataSource: sl()));
  sl.registerFactory<FetchUser>(() => FetchUser(repository: sl()));

  //! Common
  sl.registerFactory<NetworkService>(() => NetworkService(preferences: sl()));

  // Preferences
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerFactory(() => sharedPref);

  sl.registerLazySingleton<UserPreferences>(
      () => UserPreferences(sharedPreferences: sl()));
}
