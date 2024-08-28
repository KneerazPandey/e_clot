import 'package:dartz/dartz.dart';
import 'package:e_clot/core/usecase/use_case.dart';
import 'package:e_clot/data/auth/models/user_creation_request.dart';
import 'package:e_clot/domain/auth/repositories/auth_repository.dart';
import 'package:e_clot/service_locator.dart';

class SignupUseCase implements UseCase<Either, UserCreationRequest> {
  @override
  Future<Either> call(UserCreationRequest params) async {
    final repository = sl<AuthRepository>();
    return await repository.signup(params);
  }
}
