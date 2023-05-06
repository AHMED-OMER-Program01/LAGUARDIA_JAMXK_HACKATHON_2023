import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jamxk/%20common/assets.dart';
import 'package:jamxk/%20common/magic_numbers.dart';
import 'package:jamxk/Menu/main_menu.dart';
import 'package:jamxk/home/bloc/home_bloc.dart';
import 'package:jamxk/pages/carbon_input.dart';
import 'package:jamxk/pages/chart.dart';
import 'package:jamxk/pages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == HomeStatus.loaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Carbon Foot Print Solution',
                  style: const TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
              bottomNavigationBar: AppBottonBar(
                currentIndex: state.index,
              ),
              body: state.index == 0
                  ? const _HomeBody()
                  : state.index == 1
                      ? const CarbonScreen()
                      : state.index == 2
                          ? ChartPage()
                          : state.index == 3
                              ? ProfilePage()
                              : ProfilePage());
        });
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [purple, deepBlue],
            transform: GradientRotation(gradientRotation),
          ),
        ),
      ),
    );
  }
}
