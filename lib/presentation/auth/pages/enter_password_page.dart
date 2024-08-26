import 'package:e_clot/common/common.dart';
import 'package:e_clot/core/routers/routers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EnterPasswordPage extends StatelessWidget {
  const EnterPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _signinText(),
            const SizedBox(height: 20),
            _passwordField(),
            const SizedBox(height: 20),
            _forgetPassword(context),
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

  Widget _passwordField() {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Enter Password',
      ),
      obscureText: true,
    );
  }

  Widget _forgetPassword(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(text: "Forget password?"),
          TextSpan(
            text: ' Reset',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, AppRouter.forgetPasswordPageRoute);
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
        Navigator.pushNamed(context, '');
      },
    );
  }
}
