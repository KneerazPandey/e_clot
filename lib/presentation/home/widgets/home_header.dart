import 'package:e_clot/core/assets/app_images.dart';
import 'package:e_clot/core/assets/assets.dart';
import 'package:e_clot/core/theme/theme.dart';
import 'package:e_clot/domain/auth/entities/user_entity.dart';
import 'package:e_clot/presentation/home/bloc/user_info_display_cubit.dart';
import 'package:e_clot/presentation/home/bloc/user_info_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: Padding(
        padding: const EdgeInsets.only(top: 40, right: 16, left: 16),
        child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
          builder: (context, state) {
            if (state is UserInfoDisplayLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UserInfoDisplayLoadedState) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _proileImage(user: state.user, context: context),
                  _gender(state.user),
                  _card(context),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _proileImage({
    required UserEntity user,
    required BuildContext context,
  }) {
    if (user.image.isEmpty) {
      return GestureDetector(
        onTap: () {},
        child: Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.profile),
              ),
              color: Colors.red,
              shape: BoxShape.circle),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {},
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(user.image),
            ),
            color: Colors.red,
            shape: BoxShape.circle,
          ),
        ),
      );
    }
  }

  Widget _gender(UserEntity user) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Text(
          user.gender == 1 ? 'Men' : 'Women',
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
    );
  }

  Widget _card(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
            color: AppColors.primary, shape: BoxShape.circle),
        child: SvgPicture.asset(
          AppVectors.bag,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
