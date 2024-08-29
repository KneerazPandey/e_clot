import 'package:dartz/dartz.dart';
import 'package:e_clot/core/usecase/use_case.dart';
import 'package:e_clot/domain/auth/repositories/auth_repository.dart';
import 'package:e_clot/service_locator.dart';

class GetAgesUseCase extends UseCase<Either, NoParams> {
  @override
  Future<Either> call(NoParams params) async {
    final repository = sl<AuthRepository>();
    return repository.getAges();
  }
}
