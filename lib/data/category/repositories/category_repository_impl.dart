import 'package:dartz/dartz.dart';
import 'package:e_clot/data/category/datasources/category_firebase_service.dart';
import 'package:e_clot/domain/category/repositories/category_repository.dart';
import 'package:e_clot/service_locator.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future getCategories() async {
    var categoryService = sl<CategoryFirebaseService>();
    var returnData = await categoryService.getCategories();
    returnData.fold(
      (failure) => Left(failure),
      (data) {
        return Right(data);
      },
    );
  }
}
