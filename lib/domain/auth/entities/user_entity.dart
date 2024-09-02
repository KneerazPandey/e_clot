import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String image;
  final int gender;
  final String age;

  const UserEntity({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
    required this.age,
    required this.gender,
  });

  @override
  List<Object?> get props => [userId, email];
}
