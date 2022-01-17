import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wirepay_mock/home/home_navigation.dart';
import 'package:wirepay_mock/shared_resources/cubit/shared_cubit_export.dart';

import 'utils/di/di_container.dart' as di_container;

GetIt injector = GetIt.instance;

void main() {
  di_container.init(injector);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wirepay Mock',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: GoogleFonts.montserratTextTheme(),
        scaffoldBackgroundColor: Colors.white,
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        }),
        appBarTheme: const AppBarTheme(color: Colors.white),
      ),
      home: BlocProvider<HomeNavigationCubit>(
        create: (context) => injector.get<HomeNavigationCubit>(),
        child: const HomeNavigation(),
      ),
    );
  }
}
