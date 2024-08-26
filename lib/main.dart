import 'package:e_clot/core/routers/routers.dart';
import 'package:e_clot/presentation/splash/bloc/splash_cubit.dart';
import 'package:e_clot/presentation/splash/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return SplashCubit()..appStarted();
      },
      child: MaterialApp(
        title: 'E-Commerce Clot',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'CircularStd',
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
