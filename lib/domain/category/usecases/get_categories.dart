import 'package:dartz/dartz.dart';
import 'package:e_clot/core/usecase/use_case.dart';
import 'package:e_clot/domain/category/repositories/category_repository.dart';
import 'package:e_clot/service_locator.dart';

class GetCategoriesUseCase extends UseCase<Either, NoParams> {
  @override
  Future<Either> call(NoParams params) async {
    var repository = sl<CategoryRepository>();
    return await repository.getCategories();
  }
}
