import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("DIAGMASTER"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text("abc"),
              Container(
                  height: 200,
                  width: 390,
                  child: SvgPicture.asset(
                    "/assets/doctor.svg",
                    color: Colors.red,
                  )),
              Text("cdf")
            ],
          ),
        ),
      ),
    );
  }
}
