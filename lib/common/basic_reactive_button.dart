import 'package:e_clot/core/bloc/button/button_cubit.dart';
import 'package:e_clot/core/bloc/button/button_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasicReactiveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;

  const BasicReactiveButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonCubit, ButtonState>(
      builder: (BuildContext context, ButtonState state) {
        if (state is ButtonLoadingState) {
          return _loading();
        } else {
          return _initial();
        }
      },
    );
  }

  Widget _initial() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 50),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _loading() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 50),
      ),
      onPressed: null,
      child: SizedBox(
        height: height ?? 50,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
