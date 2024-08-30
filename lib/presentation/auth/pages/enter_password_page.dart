import 'package:e_clot/common/common.dart';
import 'package:e_clot/core/bloc/button/button_cubit.dart';
import 'package:e_clot/core/bloc/button/button_state.dart';
import 'package:e_clot/core/routers/routers.dart';
import 'package:e_clot/data/auth/models/user_signin_request.dart';
import 'package:e_clot/domain/auth/usecase/sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterPasswordPage extends StatelessWidget {
  EnterPasswordPage({super.key});

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final UserSigninRequest request =
        ModalRoute.of(context)!.settings.arguments as UserSigninRequest;

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
                  content: Text("Signin successfull"),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRouter.homePageRoute,
                  (route) => false,
                );
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _signinText(),
                const SizedBox(height: 20),
                _passwordField(),
                const SizedBox(height: 20),
                _forgetPassword(context),
                const SizedBox(height: 20),
                _continueButton(context, request),
              ],
            ),
          ),
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
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(
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

  Widget _continueButton(BuildContext context, UserSigninRequest request) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        title: 'Continue',
        onPressed: () {
          request.password = _passwordController.text;
          context.read<ButtonCubit>().execute(
                params: request,
                useCase: SignInUseCase(),
              );
        },
      );
    });
  }
}
