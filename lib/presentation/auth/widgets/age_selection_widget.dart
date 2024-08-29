import 'package:e_clot/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:e_clot/presentation/auth/bloc/ages_display_cubit.dart';
import 'package:e_clot/presentation/auth/bloc/ages_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgeSelectionWidget extends StatelessWidget {
  const AgeSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.7,
      child: BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
        builder: (BuildContext context, state) {
          if (state is AgesLoadingState) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          } else if (state is AgesLoadedState) {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context.read<AgeSelectionCubit>().setSelectedAge(
                            state.ages[index].data()['value'],
                          );
                      Navigator.pop(context);
                    },
                    child: Text(
                      state.ages[index].data()['value'],
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 8);
              },
              itemCount: state.ages.length,
            );
          } else if (state is AgesLoadFailureState) {
            return Container(
              alignment: Alignment.center,
              child: Text(state.message),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
