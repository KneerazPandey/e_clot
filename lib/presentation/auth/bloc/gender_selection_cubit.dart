import 'package:flutter_bloc/flutter_bloc.dart';

class GenderSelectionCubit extends Cubit<int> {
  GenderSelectionCubit() : super(1);

  int selectedIndex = 1;

  void setSelectedGender(int gender) {
    selectedIndex = gender;
    emit(selectedIndex);
  }
}
