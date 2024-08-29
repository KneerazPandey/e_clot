import 'package:e_clot/common/basic_app_bar.dart';
import 'package:e_clot/common/basic_reactive_button.dart';
import 'package:e_clot/core/bloc/button/button_cubit.dart';
import 'package:e_clot/core/bloc/button/button_state.dart';
import 'package:e_clot/core/helpers/app_bottom_sheet.dart';
import 'package:e_clot/core/theme/theme.dart';
import 'package:e_clot/data/auth/models/user_creation_request.dart';
import 'package:e_clot/domain/auth/usecase/sign_up.dart';
import 'package:e_clot/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:e_clot/presentation/auth/bloc/ages_display_cubit.dart';
import 'package:e_clot/presentation/auth/bloc/gender_selection_cubit.dart';
import 'package:e_clot/presentation/auth/widgets/age_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  const GenderAndAgeSelectionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UserCreationRequest params =
        ModalRoute.of(context)!.settings.arguments as UserCreationRequest;
    return Scaffold(
      appBar: const BasicAppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => AgeSelectionCubit(),
          ),
          BlocProvider(
            create: (BuildContext context) => GenderSelectionCubit(),
          ),
          BlocProvider(
            create: (BuildContext context) => AgesDisplayCubit(),
          ),
          BlocProvider(
            create: (BuildContext context) => ButtonCubit(),
          ),
        ],
        child: BlocListener<ButtonCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState) {
              var snackbar = SnackBar(
                content: Text(
                  state.message,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _tellUs(),
                    const SizedBox(height: 30),
                    _genders(context),
                    const SizedBox(height: 30),
                    _howOld(),
                    const SizedBox(height: 30),
                    _age(),
                  ],
                ),
              ),
              const Spacer(),
              _finishButton(context, params),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tellUs() {
    return const Text(
      'Tell us about yourself',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _whichGender() {
    return const Text(
      'Who do you shop for?',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }

  Widget _genders(BuildContext context) {
    return BlocBuilder<GenderSelectionCubit, int>(
      builder: (BuildContext context, int state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _whichGender(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _genderTile(
                  context: context,
                  genderIndex: 1,
                  gender: 'Men',
                ),
                const SizedBox(width: 20),
                _genderTile(
                  context: context,
                  genderIndex: 2,
                  gender: 'Female',
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _genderTile({
    required BuildContext context,
    required int genderIndex,
    required String gender,
  }) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          context.read<GenderSelectionCubit>().setSelectedGender(genderIndex);
        },
        child: Container(
          height: 58,
          decoration: BoxDecoration(
            color: context.read<GenderSelectionCubit>().selectedIndex ==
                    genderIndex
                ? AppColors.primary
                : AppColors.secondBackground,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              gender,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _howOld() {
    return const Text(
      'How old are you?',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }

  Widget _age() {
    return BlocBuilder<AgeSelectionCubit, String>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            AppBottomSheet.display(
              context: context,
              widget: MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: context.read<AgeSelectionCubit>(),
                  ),
                  BlocProvider.value(
                    value: context.read<AgesDisplayCubit>()..displayAges(),
                  ),
                ],
                child: const AgeSelectionWidget(),
              ),
            );
          },
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.secondBackground,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(state),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _finishButton(BuildContext context, UserCreationRequest params) {
    return Container(
      height: 100,
      color: AppColors.secondBackground,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Builder(builder: (context) {
          return BasicReactiveButton(
            onPressed: () {
              params.age = context.read<AgeSelectionCubit>().selectedAge;
              params.gender =
                  context.read<GenderSelectionCubit>().selectedIndex;
              context.read<ButtonCubit>().execute(
                    params: params,
                    useCase: SignupUseCase(),
                  );
            },
            title: 'Finish',
          );
        }),
      ),
    );
  }
}
