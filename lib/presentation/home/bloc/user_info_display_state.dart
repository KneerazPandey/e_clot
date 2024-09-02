import 'package:e_clot/domain/auth/entities/user_entity.dart';

abstract class UserInfoDisplayState {}

class UserInfoDisplayLoadingState extends UserInfoDisplayState {}

class UserInfoDisplayLoadedState extends UserInfoDisplayState {
  final UserEntity user;

  UserInfoDisplayLoadedState({required this.user});
}

class UserInfoDisplayFailureState extends UserInfoDisplayState {
  final String message;

  UserInfoDisplayFailureState({required this.message});
}
