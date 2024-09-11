import 'package:dartz/dartz.dart';
import 'package:e_clot/data/category/datasources/category_firebase_service.dart';
import 'package:e_clot/domain/category/entities/category_entity.dart';
import 'package:e_clot/domain/category/repositories/category_repository.dart';
import 'package:e_clot/service_locator.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<Either> getCategories() async {
    var categoryService = sl<CategoryFirebaseService>();
    var returnData = await categoryService.getCategories();
    return returnData.fold(
      (failure) => Left(failure),
      (data) {
        List<CategoryEntity> categories = [];
        for (int i = 0; i < data.length; i++) {
          CategoryEntity categoryEntity = data[i];
          categories.add(categoryEntity);
        }
        return Right(categories);
      },
    );
  }
}
