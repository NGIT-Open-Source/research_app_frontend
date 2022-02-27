import 'package:flutter/material.dart';
import 'package:researchapp/logic/splashscreen/splashscreen_cubit.dart';
import 'package:researchapp/logic/themecubit/theme_cubit.dart';
import 'package:researchapp/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:hive_flutter/hive_flutter.dart";

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("main");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => SplashscreenCubit(),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themestate) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "DiagMaster",
            onGenerateRoute: appRouter.onGenerateRoute,
            theme: themestate.themeData,
          );
        },
      ),
    );
  }
}
