import 'package:e_clot/core/usecase/use_case.dart';
import 'package:e_clot/domain/auth/usecase/is_logged_in.dart';
import 'package:e_clot/presentation/splash/bloc/splash_state.dart';
import 'package:e_clot/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplashState());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    var isLoggedInUseCase = sl<IsLoggedInUseCase>();
    bool isLoggedIn = await isLoggedInUseCase.call(NoParams());
    if (isLoggedIn) {
      emit(AuthenticatedState());
    } else {
      emit(UnAuthenticatedState());
    }
  }
}
