import 'package:e_clot/data/auth/datasources/auth_firebase_service.dart';
import 'package:e_clot/data/auth/repositories/auth_repository_impl.dart';
import 'package:e_clot/domain/auth/repositories/auth_repository.dart';
import 'package:e_clot/domain/auth/usecase/get_ages.dart';
import 'package:e_clot/domain/auth/usecase/sign_in.dart';
import 'package:e_clot/domain/auth/usecase/sign_up.dart';
import 'package:get_it/get_it.dart';

var sl = GetIt.instance;

Future<void> initializeDependency() async {
  // Services
  sl.registerLazySingleton<AuthFirebaseService>(
    () => AuthFirebaseServiceImpl(),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  // Usecases
  sl.registerLazySingleton<SignupUseCase>(() => SignupUseCase());
  sl.registerLazySingleton<GetAgesUseCase>(() => GetAgesUseCase());
  sl.registerLazySingleton<SignInUseCase>(() => SignInUseCase());
}
