import 'package:dartz/dartz.dart';
import 'package:e_clot/data/auth/datasources/auth_firebase_service.dart';
import 'package:e_clot/data/auth/models/user_creation_request.dart';
import 'package:e_clot/domain/auth/repositories/auth_repository.dart';
import 'package:e_clot/service_locator.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either> signup(UserCreationRequest user) async {
    var firebaseService = sl<AuthFirebaseService>();
    return await firebaseService.signUp(user);
  }

  @override
  Future<Either> getAges() async {
    var firebaseService = sl<AuthFirebaseService>();
    return await firebaseService.getAges();
  }
}
