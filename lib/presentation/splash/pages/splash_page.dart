import 'package:e_clot/core/assets/app_vectors.dart';
import 'package:e_clot/core/routers/routers.dart';
import 'package:e_clot/core/theme/theme.dart';
import 'package:e_clot/presentation/splash/bloc/splash_cubit.dart';
import 'package:e_clot/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticatedState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRouter.signinPageRoute,
            (route) => false,
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: SvgPicture.asset(AppVectors.appLogo),
        ),
      ),
    );
  }
}
