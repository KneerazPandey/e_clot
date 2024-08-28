class UserCreationRequest {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final int? gender;
  final String? age;

  const UserCreationRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.gender,
    this.age,
  });
}
