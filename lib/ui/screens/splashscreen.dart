import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:researchapp/constants.dart';
import 'package:researchapp/logic/auth_status/authstatus_cubit.dart';
import 'package:researchapp/logic/splashscreen/splashscreen_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../logic/themecubit/theme_cubit.dart';
import '../widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButtonn(context),
        appBar: AppBarr,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                      // border: Border.all(color: Colors.white),
                      ),
                  height: height / 2.1,
                  width: width,
                  child: SvgPicture.asset(
                    "lib/assets/doctor.svg",
                    // color: Colors.red,
                  )),
              Container(
                height: height / 3.5,
                decoration: BoxDecoration(
                    // border: Border.all(color: Colors.white),
                    ),
                child: BlocConsumer<SplashscreenCubit, SplashscreenState>(
                  listener: (context, state) {
                    // TODO: implement listener
                    if (state is ToHome) {
                      context.read<AuthstatusCubit>().login(state.name);
                      Navigator.pushReplacementNamed(context, HOME_ROUTE);
                    } else if (state is SessionExpired) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Session Expired! Relogin!"),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is SplashscreenInitial) {
                      return Container(
                        child: Center(
                          child: Text("initial"),
                        ),
                      );
                    } else if (state is ConnectivityError) {
                      return Container(
                        child: Text("Internet Error"),
                      );
                    } else if (state is ShowButtons ||
                        state is SessionExpired) {
                      return Container(
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, LOGIN_PAGE);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.5,
                                      color: context
                                          .read<ThemeCubit>()
                                          .state
                                          .themeData
                                          .primaryColor),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                height: height / 11,
                                width: width / 3,
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, SIGNUP_PAGE);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.5,
                                        color: context
                                            .read<ThemeCubit>()
                                            .state
                                            .themeData
                                            .primaryColor),
                                    borderRadius: BorderRadius.circular(20.0)),
                                height: height / 11,
                                width: width / 3,
                                child: Center(
                                  child: Text(
                                    "Sign Up",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return Container(
                        child: Center(
                          child: Text("uhh weird"),
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
