import 'package:flutter/material.dart';
import 'package:researchapp/constants.dart';
import 'package:researchapp/logic/auth_status/authstatus_cubit.dart';
import 'package:researchapp/logic/splashscreen/splashscreen_cubit.dart';
import 'package:researchapp/logic/themecubit/theme_cubit.dart';
import '../widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    int gettheme() {
      return BlocProvider.of<ThemeCubit>(context).gettheme() == "Light" ? 0 : 1;
    }

    return Scaffold(
      appBar: AppBarr,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: Column(
            children: [
              Text(
                "Settings",
                style: GoogleFonts.notoSans(
                    fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: Container(
                  height: height / 10,
                  padding: EdgeInsets.all(10),
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: Colors.white)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        " Theme ",
                        style: GoogleFonts.notoSans(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      ToggleSwitch(
                        minWidth: 60.0,
                        initialLabelIndex: gettheme(),
                        cornerRadius: 20.0,
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        icons: [FontAwesomeIcons.sun, FontAwesomeIcons.moon],
                        activeBgColors: [
                          [Colors.blue],
                          [Colors.teal]
                        ],
                        onToggle: (index) {
                          context.read<ThemeCubit>().changetheme();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      context.read<AuthstatusCubit>().logout();
                      context.read<SplashscreenCubit>().initialize();
                      Navigator.pushNamedAndRemoveUntil(
                          context, SPLASH_SCREEN, (route) => false);
                    },
                    child: Container(
                      width: width / 2.9,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: context.read<ThemeCubit>().gettheme() ==
                                      "Light"
                                  ? Colors.black
                                  : Colors.teal)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Log Out   ",
                            style: GoogleFonts.notoSans(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Icon(FontAwesomeIcons.rightFromBracket)
                        ],
                      ),
                    ),
                  ),
                  height: height / 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
