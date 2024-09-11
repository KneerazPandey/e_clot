import 'package:e_clot/core/bloc/categories/categories_display_state.dart';
import 'package:e_clot/core/usecase/use_case.dart';
import 'package:e_clot/domain/category/entities/category_entity.dart';
import 'package:e_clot/domain/category/usecases/get_categories.dart';
import 'package:e_clot/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  CategoriesDisplayCubit() : super(CategoriesLoadingState());

  void displayCategories() async {
    var usecase = sl<GetCategoriesUseCase>();

    var returnedData = await usecase.call(NoParams());

    returnedData.fold(
      (failure) => emit(CategoriesFailureState(message: failure)),
      (categories) {
        List<CategoryEntity> datas = [];
        for (int i = 0; i < categories.length; i++) {
          CategoryEntity entity = categories[i];
          datas.add(entity);
        }
        emit(CategoriesLoadedState(categories: datas));
      },
    );
  }
}
