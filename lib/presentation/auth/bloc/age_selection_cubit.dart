import 'package:flutter_bloc/flutter_bloc.dart';

class AgeSelectionCubit extends Cubit<String> {
  String selectedAge = '';

  AgeSelectionCubit() : super('Age Range');

  void setSelectedAge(String age) {
    selectedAge = age;
    emit(selectedAge);
  }
}
