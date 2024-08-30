import 'package:dartz/dartz.dart';
import 'package:e_clot/core/constant/firebase_constant.dart';
import 'package:e_clot/data/auth/models/user_creation_request.dart';
import 'package:e_clot/data/auth/models/user_signin_request.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(UserCreationRequest user);

  Future<Either> getAges();

  Future<Either> signin(UserSigninRequest user);
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signUp(UserCreationRequest user) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      await FirebaseFirestore.instance
          .collection(FirebaseConstant.userCollection)
          .doc(credential.user!.uid)
          .set(
        {
          'firstName': user.firstName,
          'lastName': user.lastName,
          'gender': user.gender,
          'age': user.age,
        },
      );
      return const Right('Sign up was successfull');
    } on FirebaseAuthException catch (error) {
      String message = '';
      if (error.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (error.code == 'email-already-in-use') {
        message = 'An account already exists with this email';
      }
      return Left(message);
    } catch (error) {
      return Left(error.toString());
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var ages = await FirebaseFirestore.instance
          .collection(FirebaseConstant.ageCollection)
          .get();
      return Right(ages.docs);
    } catch (error) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> signin(UserSigninRequest user) async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      if (userCredential.user == null) {
        return const Left("Invalid email or password");
      }
      return const Right('Signin successfull');
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email') {
        return const Left("Invalid email address.");
      }
      if (error.code == 'invalid-credential') {
        return const Left('Invalid email and password');
      }
      return const Left('Invalid email and password');
    } catch (error) {
      return const Left('Server error. Please try again');
    }
  }
}
