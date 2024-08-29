import 'package:e_clot/core/usecase/use_case.dart';
import 'package:e_clot/domain/auth/usecase/get_ages.dart';
import 'package:e_clot/presentation/auth/bloc/ages_display_state.dart';
import 'package:e_clot/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayState> {
  AgesDisplayCubit() : super(AgesLoadingState());

  void displayAges() async {
    var agesEither = await sl<GetAgesUseCase>().call(NoParams());
    agesEither.fold(
      (failure) => emit(AgesLoadFailureState(failure)),
      (ages) => emit(AgesLoadedState(ages)),
    );
  }
}
