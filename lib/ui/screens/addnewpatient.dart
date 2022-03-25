import 'dart:io';

import 'package:flutter/material.dart';
import 'package:researchapp/logic/add_patient/addpatient_cubit.dart';
import 'package:researchapp/logic/file_upload/file_uploadf_cubit.dart';
import 'package:researchapp/logic/themecubit/theme_cubit.dart';
import '../widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:file_picker/file_picker.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AddPatient extends StatefulWidget {
  AddPatient({Key? key}) : super(key: key);

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  showtoast(String message) {
    Fluttertoast.showToast(
      msg: message, // message
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.BOTTOM, // location
      timeInSecForIosWeb: 4,
    );
  }

  var namecontroller = TextEditingController();
  var casen = TextEditingController();
  var descont = TextEditingController();
  var fkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarr,
      floatingActionButton: FloatingActionButtonn(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height,
          width: width,
          // decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          child: Form(
            key: fkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          "Name of the patient",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 30),
                          child: TextFormField(
                            validator: ((value) {
                              if (value == null || value.isEmpty)
                                return 'Please enter some text';
                              else if (value.length < 5)
                                return "Enter a longer name";
                              return null;
                            }),
                            controller: namecontroller,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          "Case Name",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 30),
                          child: TextFormField(
                            validator: ((value) {
                              if (value == null || value.isEmpty)
                                return 'Please enter some text';
                              else if (value.length < 5)
                                return "Enter a longer casename";
                              return null;
                            }),
                            controller: casen,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          "Description",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 30),
                          child: TextFormField(
                            validator: ((value) {
                              if (value == null || value.isEmpty)
                                return 'Please enter some text';
                              else if (value.length < 6)
                                return "Enter a description";
                              return null;
                            }),
                            controller: descont,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Container(
                    height: height / 7,
                    width: width / 2,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: BlocBuilder<FileUploadfCubit, FileUploadfState>(
                      builder: (context, state) {
                        if (state is FileUploadfInitial) {
                          return GestureDetector(
                            onTap: () async {
                              File file;
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                      type: FileType.custom,
                                      allowedExtensions: ["dcm", "DCM"]);
                              if (result != null) {
                                file = File(result.files.single.path!);
                                context
                                    .read<FileUploadfCubit>()
                                    .fileupload(file);
                              } else {
                                showtoast("No File was selected");
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: context.read<ThemeCubit>().gettheme() ==
                                        "Light"
                                    ? Colors.black
                                    : Colors.teal,
                              )),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Select a File",
                                        style: GoogleFonts.notoSans(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(FontAwesomeIcons.fileImage),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else if (state is FileUploadLoad) {
                          return SpinKitRotatingCircle(
                            color:
                                context.read<ThemeCubit>().gettheme() == "Light"
                                    ? Colors.black
                                    : Colors.teal,
                            size: 50.0,
                          );
                        } else if (state is FileUploadSuccess) {
                          return Container(
                              child: Center(child: Text("File was uploaded")));
                        } else {
                          return Container(
                            child: Text("oomf state"),
                          );
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: BlocBuilder<FileUploadfCubit, FileUploadfState>(
                    builder: (context, filestate) {
                      return BlocConsumer<AddpatientCubit, AddpatientState>(
                        listener: (context, state) {
                          if (state is AddPatientError)
                            showtoast("There was an error adding the patient");
                        },
                        builder: (context, state) {
                          if (state is AddpatientInitial)
                            return ElevatedButton(
                                onPressed: () {
                                  if (fkey.currentState!.validate()) {
                                    if (filestate is FileUploadSuccess) {
                                      {
                                        context
                                            .read<AddpatientCubit>()
                                            .addpatient(
                                                namecontroller.text,
                                                casen.text,
                                                descont.text,
                                                filestate.id);
                                      }
                                    } else
                                      showtoast("Upload a DICOM First!");
                                  }
                                },
                                child: Text("Add"));
                          else if (state is AddPatientLoad) {
                            return SpinKitRotatingCircle(
                              color: context.read<ThemeCubit>().gettheme() ==
                                      "Light"
                                  ? Colors.black
                                  : Colors.teal,
                              size: 50.0,
                            );
                          } else if (state is AddPatientSuccess) {
                            return Column(
                              children: [
                                Container(
                                  child: Text("Patient Added sucesssfully"),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      context.read<FileUploadfCubit>().reload();
                                      context.read<AddpatientCubit>().reload();
                                    },
                                    child: Text("Add another"))
                              ],
                            );
                          } else if (state is AddPatientError) {
                            return ElevatedButton(
                                onPressed: () {
                                  context.read<FileUploadfCubit>().reload();
                                  context.read<AddpatientCubit>().reload();
                                },
                                child: Text("Error:Retry"));
                          } else
                            return Container(
                              child: Text("oomf state"),
                            );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
