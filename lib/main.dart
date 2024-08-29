import 'package:e_clot/core/routers/routers.dart';
import 'package:e_clot/core/theme/app_theme.dart';
import 'package:e_clot/firebase_options.dart';
import 'package:e_clot/presentation/splash/bloc/splash_cubit.dart';
import 'package:e_clot/presentation/splash/pages/splash_page.dart';
import 'package:e_clot/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependency();
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
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
