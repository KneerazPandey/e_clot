import 'dart:convert';

import 'package:e_clot/domain/auth/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.userId,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.gender,
    required super.image,
    required super.age,
  });

  @override
  List<Object> get props {
    return [
      userId,
      firstName,
      lastName,
      email,
      image,
      gender,
      age,
    ];
  }

  UserModel copyWith({
    String? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? image,
    int? gender,
    String? age,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      image: image ?? this.image,
      gender: gender ?? this.gender,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'image': image,
      'gender': gender,
      'age': age,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] ?? '',
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'] ?? '',
      image: map['image'] ?? '',
      gender: (map['gender'] as num).toInt(),
      age: map['age'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
