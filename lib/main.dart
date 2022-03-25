import 'package:flutter/material.dart';
import 'package:researchapp/logic/auth_status/authstatus_cubit.dart';
import 'package:researchapp/logic/file_upload/file_uploadf_cubit.dart';
import 'package:researchapp/logic/logincubit/logincubit_cubit.dart';
import 'package:researchapp/logic/signupcubit/signup_cubit.dart';
import 'package:researchapp/logic/splashscreen/splashscreen_cubit.dart';
import 'package:researchapp/logic/themecubit/theme_cubit.dart';
import 'package:researchapp/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:hive_flutter/hive_flutter.dart";
import 'package:researchapp/services/auth_service.dart';
import 'package:researchapp/logic/add_patient/addpatient_cubit.dart';
import 'package:researchapp/services/data_calls.dart';
import 'package:researchapp/services/file_upload.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("main");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AppRouter appRouter = AppRouter();
  final AuthService authService = AuthService();
  final FileUploader fileUploader = FileUploader();
  final DataClass dataClass=DataClass();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthstatusCubit(),
        ),
        BlocProvider(
            create: (context) => SignupCubit(authService: authService)),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => SplashscreenCubit(),
        ),
        BlocProvider(
          create: ((context) => LogincubitCubit(authService: authService)),
        ),
        BlocProvider(
          create: (context) => AddpatientCubit(dataClass:dataClass ),
        ),
        BlocProvider(
          create: ((context) => FileUploadfCubit(fileUploader: fileUploader)),
        ),
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
