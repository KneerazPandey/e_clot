import 'package:e_clot/common/common.dart';
import 'package:e_clot/core/assets/assets.dart';
import 'package:e_clot/core/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordResetEmailPage extends StatelessWidget {
  const PasswordResetEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _emailSending(),
          const SizedBox(
            height: 30,
          ),
          _sentEmail(),
          const SizedBox(
            height: 30,
          ),
          _returnToLoginButton(context)
        ],
      ),
    );
  }

  Widget _emailSending() {
    return Center(
      child: SvgPicture.asset(
        AppVectors.emailSending,
      ),
    );
  }

  Widget _sentEmail() {
    return const Center(
      child: Text('We Sent you an Email to reset your password.'),
    );
  }

  Widget _returnToLoginButton(BuildContext context) {
    return BasicAppButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRouter.signinPageRoute,
            (route) => false,
          );
        },
        title: 'Return to Login');
  }
}
