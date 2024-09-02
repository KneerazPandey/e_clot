import 'package:dartz/dartz.dart';
import 'package:e_clot/data/auth/models/user_creation_request.dart';
import 'package:e_clot/data/auth/models/user_signin_request.dart';

abstract class AuthRepository {
  Future<Either> signup(UserCreationRequest user);

  Future<Either> getAges();

  Future<Either> signin(UserSigninRequest user);

  Future<Either> sendPasswordResetEmail(String email);

  Future<bool> isLoggedIn();

  Future<Either> getUser();
}
