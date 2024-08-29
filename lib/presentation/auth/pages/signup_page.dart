import 'package:e_clot/common/common.dart';
import 'package:e_clot/core/routers/routers.dart';
import 'package:e_clot/data/auth/models/user_creation_request.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _signupText(),
              const SizedBox(height: 20),
              _firstNameField(),
              const SizedBox(height: 20),
              _lastNameField(),
              const SizedBox(height: 20),
              _emailField(),
              const SizedBox(height: 20),
              _passwordField(),
              const SizedBox(height: 20),
              _signinWithExistingAccount(context),
              const SizedBox(height: 20),
              _continueButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signupText() {
    return const Text(
      'Sign up',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
    );
  }

  Widget _firstNameField() {
    return TextField(
      controller: _firstNameController,
      decoration: const InputDecoration(
        hintText: 'Firstname',
      ),
    );
  }

  Widget _lastNameField() {
    return TextField(
      controller: _lastNameController,
      decoration: const InputDecoration(
        hintText: 'Lastname',
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: 'Email',
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(
        hintText: 'Password',
      ),
    );
  }

  Widget _signinWithExistingAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(text: "Do you have an account?"),
          TextSpan(
            text: ' Signin',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, AppRouter.signinPageRoute);
              },
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      title: 'Continue',
      onPressed: () {
        Navigator.pushNamed(
          context,
          AppRouter.genderAndAgeSelectionPageRoute,
          arguments: UserCreationRequest(
            firstName: _firstNameController.text,
            lastName: _lastNameController.text,
            email: _emailController.text,
            password: _passwordController.text,
          ),
        );
      },
    );
  }
}
