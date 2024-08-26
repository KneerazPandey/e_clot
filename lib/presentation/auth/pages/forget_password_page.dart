import 'package:e_clot/common/common.dart';
import 'package:e_clot/core/routers/routers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _forgetPasswordText(),
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

  Widget _forgetPasswordText() {
    return const Text(
      'Forget Password',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
    );
  }

  Widget _emailField() {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Enter your email',
      ),
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(text: "Remember your password?"),
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
