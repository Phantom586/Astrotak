import 'package:astrotak/data/repositories/ques_category_repository.dart';
import 'package:astrotak/data/repositories/relatives_repository.dart';
import 'package:astrotak/presentation/screens/profile/profile.dart';
import 'package:astrotak/presentation/screens/bottom_nav_bar.dart';
import 'package:astrotak/logic/cubit/question_category_cubit.dart';
import 'package:astrotak/presentation/screens/splash.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:astrotak/logic/cubit/internet_cubit.dart';
import 'package:astrotak/logic/bloc/relatives_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  const MyApp({Key? key, required this.connectivity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(connectivity: connectivity),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) => BlocProvider(
                create: (context) => QuestionCategoryCubit(
                    quesCategoryRepository: const QuestionCategoryRepository()),
                child: const BottomNavBar(),
              ),
          '/profile': (context) => BlocProvider(
                create: (context) => RelativesBloc(
                    relativesRepository: const RelativesRepository()),
                child: const MyProfile(),
              )
        },
      ),
    );
  }
}
