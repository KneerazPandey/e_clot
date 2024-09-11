import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_clot/core/constant/constant.dart';
import 'package:e_clot/data/category/models/category_model.dart';

abstract class CategoryFirebaseService {
  Future<Either> getCategories();
}

class CategoryFirebaseServiceImpl implements CategoryFirebaseService {
  @override
  Future<Either> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> categoriesSnapshot =
          await FirebaseFirestore.instance
              .collection(FirebaseConstant.categoryCollection)
              .get();

      List<CategoryModel> categories = categoriesSnapshot.docs
          .map((category) => CategoryModel.fromMap(category.data()))
          .toList();

      if (categories.isEmpty) {
        return const Right([]);
      } else {
        return Right(categories);
      }
    } catch (error) {
      return const Left('Something went wrong. Please try again.');
    }
  }
}
