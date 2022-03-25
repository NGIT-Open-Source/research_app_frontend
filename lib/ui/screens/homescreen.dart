import 'package:flutter/material.dart';
import 'package:researchapp/constants.dart';
import 'package:researchapp/logic/auth_status/authstatus_cubit.dart';
import 'package:researchapp/logic/themecubit/theme_cubit.dart';
import '../../logic/splashscreen/splashscreen_cubit.dart';
import '../widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<AuthstatusCubit, AuthstatusState>(
      builder: (context, state) {
        if (state is LoggedIn) {
          return Scaffold(
            floatingActionButton: FloatingActionButtonn(context),
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        context.read<AuthstatusCubit>().logout();
                        context.read<SplashscreenCubit>().initialize();
                        Navigator.pushNamedAndRemoveUntil(
                            context, SPLASH_SCREEN, (route) => false);
                      },
                      child: Icon(FontAwesomeIcons.rightFromBracket)),
                )
              ],
              centerTitle: true,
              title: Text("DIAGMASTER"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: Text(
                        " Welcome ${state.username}",
                        style: GoogleFonts.notoSans(
                            fontSize: 22, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      height: height * (2.1 / 3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, ADD_PATIENT);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              height: height / 5,
                              width: width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: context
                                                  .read<ThemeCubit>()
                                                  .gettheme() ==
                                              "Light"
                                          ? Colors.black
                                          : Colors.teal)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Icon(FontAwesomeIcons.userPlus),
                                    ),
                                    Text(
                                      "Add a new Patient",
                                      style: GoogleFonts.notoSans(fontSize: 18),
                                    ),
                                  ]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, VIEW_PATIENTS);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              height: height / 5,
                              width: width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: context
                                                  .read<ThemeCubit>()
                                                  .gettheme() ==
                                              "Light"
                                          ? Colors.black
                                          : Colors.teal)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Icon(FontAwesomeIcons.user),
                                    ),
                                    Text(
                                      "View Existing Patients",
                                      style: GoogleFonts.notoSans(fontSize: 18),
                                    ),
                                  ]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, SETTINGS);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              height: height / 5,
                              width: width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: context
                                                  .read<ThemeCubit>()
                                                  .gettheme() ==
                                              "Light"
                                          ? Colors.black
                                          : Colors.teal)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Icon(FontAwesomeIcons.gear),
                                    ),
                                    Text(
                                      "App Settings",
                                      style: GoogleFonts.notoSans(fontSize: 18),
                                    ),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(child: Text("unknown state")),
          );
        }
      },
    );
  }
}
