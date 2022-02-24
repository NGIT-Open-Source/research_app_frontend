import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:researchapp/logic/themecubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          BlocProvider.of<ThemeCubit>(context).changetheme();
        }),
        appBar: AppBar(
          centerTitle: true,
          title: Text("DIAGMASTER"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  height: 350,
                  width: 490,
                  child: SvgPicture.asset(
                    "lib/assets/doctor.svg",
                    // color: Colors.red,
                  )),
              Container(
                height: 200,
                width: 800,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
