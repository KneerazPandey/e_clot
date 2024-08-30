import 'package:dartz/dartz.dart';
import 'package:e_clot/core/usecase/use_case.dart';
import 'package:e_clot/domain/auth/repositories/auth_repository.dart';
import 'package:e_clot/service_locator.dart';

class SendPasswordResetEmailUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call(String params) async {
    var repository = sl<AuthRepository>();
    return repository.sendPasswordResetEmail(params);
  }
}
