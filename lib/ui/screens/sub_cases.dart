import 'dart:io';

import 'package:flutter/material.dart';
import 'package:researchapp/constants.dart';
import 'package:researchapp/logic/sub_cases/viewsubcases_cubit.dart';
import 'package:researchapp/ui/screens/webview.dart';
import '../widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SubCases extends StatefulWidget {
  const SubCases({Key? key}) : super(key: key);

  @override
  State<SubCases> createState() => _SubCasesState();
}

class _SubCasesState extends State<SubCases> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

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
                Navigator.pushNamed(context, ADD_SUB_CASE);
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
                "Sub Cases  ",
                style: GoogleFonts.notoSans(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              BlocBuilder<ViewsubcasesCubit, ViewsubcasesState>(
                builder: (context, state) {
                  if (state is ViewSubCasesShow) {
                    return Container(
                        child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: state.subcases_list.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            var fileId = state
                                .subcases[state.subcases_list[index]][0][0];
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WebDICOM(
                                    FileID: fileId,
                                  ),
                                ));
                          },
                          child: ListTile(
                            title: Text(state.subcases_list[index]),
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
