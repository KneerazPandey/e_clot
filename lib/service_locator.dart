import 'package:e_clot/data/auth/datasources/auth_firebase_service.dart';
import 'package:e_clot/data/auth/repositories/auth_repository_impl.dart';
import 'package:e_clot/data/category/datasources/category_firebase_service.dart';
import 'package:e_clot/data/category/repositories/category_repository_impl.dart';
import 'package:e_clot/domain/auth/repositories/auth_repository.dart';
import 'package:e_clot/domain/auth/usecase/get_ages.dart';
import 'package:e_clot/domain/auth/usecase/get_user.dart';
import 'package:e_clot/domain/auth/usecase/is_logged_in.dart';
import 'package:e_clot/domain/auth/usecase/send_password_reset_email.dart';
import 'package:e_clot/domain/auth/usecase/sign_in.dart';
import 'package:e_clot/domain/auth/usecase/sign_up.dart';
import 'package:e_clot/domain/category/repositories/category_repository.dart';
import 'package:e_clot/domain/category/usecases/get_categories.dart';
import 'package:get_it/get_it.dart';

var sl = GetIt.instance;

Future<void> initializeDependency() async {
  //! Services
  //* Auth Services
  sl.registerLazySingleton<AuthFirebaseService>(
    () => AuthFirebaseServiceImpl(),
  );

  //* Category Services
  sl.registerLazySingleton<CategoryFirebaseService>(
    () => CategoryFirebaseServiceImpl(),
  );

  //! Repositories
  //* Auth Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  //* Category Repository
  sl.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl());

  //! Usecases
  //* Auth Usecase
  sl.registerLazySingleton<SignupUseCase>(() => SignupUseCase());
  sl.registerLazySingleton<GetAgesUseCase>(() => GetAgesUseCase());
  sl.registerLazySingleton<SignInUseCase>(() => SignInUseCase());
  sl.registerLazySingleton<SendPasswordResetEmailUseCase>(
    () => SendPasswordResetEmailUseCase(),
  );
  sl.registerLazySingleton<IsLoggedInUseCase>(() => IsLoggedInUseCase());
  sl.registerLazySingleton<GetUserUseCase>(() => GetUserUseCase());

  //* Category Usecase
  sl.registerLazySingleton<GetCategoriesUseCase>(() => GetCategoriesUseCase());
}
