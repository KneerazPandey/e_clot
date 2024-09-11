import 'package:e_clot/presentation/home/widgets/home_categories.dart';
import 'package:e_clot/presentation/home/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: <Widget>[
        HomeHeader(),
        SizedBox(height: 30),
        HomeCategories(),
      ],
    ));
  }
}
