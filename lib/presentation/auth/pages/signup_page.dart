import 'package:e_clot/common/common.dart';
import 'package:e_clot/core/routers/routers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: Padding(
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
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Firstname',
      ),
    );
  }

  Widget _lastNameField() {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Lastname',
      ),
    );
  }

  Widget _emailField() {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Email',
      ),
    );
  }

  Widget _passwordField() {
    return const TextField(
      decoration: InputDecoration(
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
        Navigator.pushNamed(context, AppRouter.enterPasswordPageRoute);
      },
    );
  }
}
