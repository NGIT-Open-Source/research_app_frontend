import 'package:flutter/material.dart';
import 'package:researchapp/logic/auth_status/authstatus_cubit.dart';
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
    return BlocBuilder<AuthstatusCubit, AuthstatusState>(
      builder: (context, state) {
        if (state is LoggedIn) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {},
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        " Welcome ${state.username}",
                        style: GoogleFonts.notoSans(
                            fontSize: 22, fontWeight: FontWeight.w300),
                      ),
                    ),
                    Container(
                      height: height * (2.1 / 3),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                    )
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
