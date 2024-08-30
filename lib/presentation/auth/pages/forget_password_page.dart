import 'package:e_clot/common/common.dart';
import 'package:e_clot/core/bloc/button/button_cubit.dart';
import 'package:e_clot/core/bloc/button/button_state.dart';
import 'package:e_clot/core/routers/routers.dart';
import 'package:e_clot/domain/auth/usecase/send_password_reset_email.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({super.key});

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: BlocProvider(
          create: (context) => ButtonCubit(),
          child: BlocListener<ButtonCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonFailureState) {
                var snackBar = SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              if (state is ButtonSuccessState) {
                var snackBar = const SnackBar(
                  content: Text(
                    "Password reset link has been sent to your email address.",
                  ),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRouter.passwordResetEmailPageRoute,
                  (route) => false,
                );
              }
            },
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
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
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
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          title: 'Continue',
          onPressed: () {
            context.read<ButtonCubit>().execute(
                  params: _emailController.text,
                  useCase: SendPasswordResetEmailUseCase(),
                );
          },
        );
      },
    );
  }
}
