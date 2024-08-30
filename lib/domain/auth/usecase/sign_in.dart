import 'package:dartz/dartz.dart';
import 'package:e_clot/core/usecase/use_case.dart';
import 'package:e_clot/data/auth/models/user_signin_request.dart';
import 'package:e_clot/domain/auth/repositories/auth_repository.dart';
import 'package:e_clot/service_locator.dart';

class SignInUseCase extends UseCase<Either, UserSigninRequest> {
  @override
  Future<Either> call(UserSigninRequest params) async {
    var repository = sl<AuthRepository>();
    return await repository.signin(params);
  }
}
