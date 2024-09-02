import 'package:e_clot/core/usecase/use_case.dart';
import 'package:e_clot/domain/auth/usecase/get_user.dart';
import 'package:e_clot/presentation/home/bloc/user_info_display_state.dart';
import 'package:e_clot/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  UserInfoDisplayCubit() : super(UserInfoDisplayLoadingState());

  void displayUserInfo() async {
    var returnedData = await sl<GetUserUseCase>().call(NoParams());
    returnedData.fold(
      (failure) =>
          emit(UserInfoDisplayFailureState(message: failure.toString())),
      (data) => emit(
        UserInfoDisplayLoadedState(user: data),
      ),
    );
  }
}
