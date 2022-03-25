import 'package:flutter/material.dart';
import 'package:researchapp/constants.dart';
import 'package:researchapp/logic/sub_cases/viewsubcases_cubit.dart';
import 'package:researchapp/logic/view_cases/view_cases_cubit.dart';
import 'package:researchapp/logic/view_patients/view_patients_cubit.dart';
import 'package:researchapp/services/exceptions.dart';
import '../../logic/themecubit/theme_cubit.dart';
import '../widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewCases extends StatefulWidget {
  const ViewCases({Key? key}) : super(key: key);

  @override
  State<ViewCases> createState() => _ViewCasesState();
}

class _ViewCasesState extends State<ViewCases> {
  showtoast(String message) {
    Fluttertoast.showToast(
      msg: message, // message
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.BOTTOM, // location
      timeInSecForIosWeb: 4,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ADD_CASE);
              },
              icon: Icon(FontAwesomeIcons.plus))
        ],
        title: Text("DIAGMASTER"),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                "Cases  ",
                style: GoogleFonts.notoSans(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              BlocBuilder<ViewCasesCubit, ViewCasesState>(
                builder: (context, state) {
                  if (state is ViewCasesShow) {
                    return Container(
                        child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: state.cases.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // patient name set
                            context.read<ViewsubcasesCubit>().patientname =
                                context.read<ViewCasesCubit>().patientname;
                            //case name set
                            context.read<ViewsubcasesCubit>().casename =
                                state.cases[index];
                            context.read<ViewsubcasesCubit>().showsubcases(
                                state.subcases[state.cases[index]]);
                            Navigator.pushNamed(context, VIEW_SUB_CASES);
                          },
                          child: ListTile(
                            title: Text(state.cases[index]),
                          ),
                        );
                      },
                    ));
                  } else
                    return Container(
                      child: Text("Weird state"),
                    );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
