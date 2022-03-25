import 'package:flutter/material.dart';
import 'package:researchapp/constants.dart';
import 'package:researchapp/logic/view_cases/view_cases_cubit.dart';
import 'package:researchapp/logic/view_patients/view_patients_cubit.dart';
import 'package:researchapp/services/exceptions.dart';
import '../../logic/themecubit/theme_cubit.dart';
import '../widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ViewPatients extends StatefulWidget {
  const ViewPatients({Key? key}) : super(key: key);

  @override
  State<ViewPatients> createState() => _ViewPatientsState();
}

class _ViewPatientsState extends State<ViewPatients> {
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
    context.read<ViewPatientsCubit>().getpatients();
    return Scaffold(
      appBar: AppBarr,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Patients  ",
                style: GoogleFonts.notoSans(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              BlocConsumer<ViewPatientsCubit, ViewPatientsState>(
                listener: (context, state) {
                  if (state is ViewPatientInternetError)
                    showtoast("Internet Error");
                  if (state is ServerError) showtoast("Server Error");
                },
                builder: (context, state) {
                  if (state is ViewPatientsInitial ||
                      state is ViewPatientsLoad) {
                    return SpinKitRotatingCircle(
                      color: context.read<ThemeCubit>().gettheme() == "Light"
                          ? Colors.black
                          : Colors.teal,
                      size: 50.0,
                    );
                  } else if (state is ViewPatientsSucess) {
                    return Container(
                        child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      reverse: false,
                      itemCount: state.patients.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.read<ViewCasesCubit>().patientname =
                                state.patients[index];
                            context
                                .read<ViewCasesCubit>()
                                .showcases(state.cases[state.patients[index]]);
                            Navigator.pushNamed(context, VIew_CASES);
                          },
                          child: ListTile(
                            title: Text(state.patients[index]),
                          ),
                        );
                      },
                    ));
                  } else {
                    return Container(
                      child: Column(
                        children: [
                          Text("error state"),
                          ElevatedButton(
                              onPressed: () {}, child: Text("retry")),
                        ],
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
