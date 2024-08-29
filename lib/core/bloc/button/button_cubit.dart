import 'package:dartz/dartz.dart';
import 'package:e_clot/core/bloc/button/button_state.dart';
import 'package:e_clot/core/usecase/use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonInitialState());

  Future<void> execute({
    required dynamic params,
    required UseCase useCase,
  }) async {
    emit(ButtonLoadingState());
    try {
      Either returnedEither = await useCase.call(params);
      returnedEither.fold(
        (l) => emit(ButtonFailureState(l.toString())),
        (r) => emit(ButtonSuccessState()),
      );
    } catch (error) {
      emit(ButtonFailureState(error.toString()));
    }
  }
}
