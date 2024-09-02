import 'package:dartz/dartz.dart';
import 'package:e_clot/core/usecase/use_case.dart';
import 'package:e_clot/domain/auth/repositories/auth_repository.dart';
import 'package:e_clot/service_locator.dart';

class GetUserUseCase extends UseCase<Either, NoParams> {
  @override
  Future<Either> call(NoParams params) async {
    var repository = sl<AuthRepository>();
    return await repository.getUser();
  }
}
