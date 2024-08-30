import 'package:e_clot/common/common.dart';
import 'package:e_clot/core/routers/routers.dart';
import 'package:e_clot/data/auth/models/user_signin_request.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(hideBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _signinText(),
            const SizedBox(height: 20),
            _emailField(),
            const SizedBox(height: 20),
            _createAccount(context),
            const SizedBox(height: 20),
            _continueButton(context),
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return const Text(
      'Sign in',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: 'Enter Email',
      ),
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(text: "Don't have an account?"),
          TextSpan(
            text: ' Creatre One',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, AppRouter.signupPageRoute);
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
          AppRouter.enterPasswordPageRoute,
          arguments: UserSigninRequest(
            email: _emailController.text,
            password: '',
          ),
        );
      },
    );
  }
}
