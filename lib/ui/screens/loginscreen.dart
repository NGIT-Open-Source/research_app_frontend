import 'package:flutter/material.dart';
import 'package:researchapp/constants.dart';
import 'package:researchapp/logic/auth_status/authstatus_cubit.dart';
import 'package:researchapp/logic/logincubit/logincubit_cubit.dart';
import 'package:researchapp/logic/themecubit/theme_cubit.dart';
import 'package:researchapp/ui/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  final usernamekey = GlobalKey<FormState>();
  final passwordkey = GlobalKey<FormState>();
  final userfield = TextEditingController();
  final pwdfield = TextEditingController();
  showtoast(String message) {
    Fluttertoast.showToast(
      msg: message, // message
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.BOTTOM, // location
      timeInSecForIosWeb: 4,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarr,
      floatingActionButton: FloatingActionButtonn(context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "User Name:",
              textAlign: TextAlign.left,
            ),
          ),
          Form(
            key: usernamekey,
            child: TextFormField(
              controller: userfield,
              validator: ((value) {
                if (value == null || value.isEmpty)
                  return 'Please enter some text';
                else if (value.length < 6) return "Enter a longer username";
                return null;
              }),
            ),
          ),
          Container(
            height: 30,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Password:",
              textAlign: TextAlign.left,
            ),
          ),
          Form(
            key: passwordkey,
            child: TextFormField(
              controller: pwdfield,
              obscureText: true,
              validator: ((value) {
                if (value == null || value.isEmpty)
                  return 'Please enter some text';
                else if (value.length < 6) return "Enter a longer password";
                return null;
              }),
            ),
          ),
          Container(
            height: 30,
          ),
          BlocConsumer<LogincubitCubit, LogincubitState>(
            listener: ((context, state) {
              if (state is PasswordErrorState) {
                showtoast("Incorrect Password !");
              } else if (state is UserNotFound) {
                showtoast("User not found !");
              } else if (state is LoginError) {
                showtoast("Weird Error !");
              } else if (state is LoginSuccess) {
                context.read<AuthstatusCubit>().login(state.name);
                Navigator.pushNamedAndRemoveUntil(
                    context, HOME_ROUTE, (route) => false);
              }
            }),
            builder: (context, state) {
              if (state is LogincubitInitial) {
                return ElevatedButton(
                    onPressed: () {
                      if (usernamekey.currentState!.validate()) {
                        if (passwordkey.currentState!.validate()) {
                          //you are cool to continue
                          context
                              .read<LogincubitCubit>()
                              .login(userfield.text, pwdfield.text);
                        }
                      }
                    },
                    child: Text("Submit"));
              } else if (state is LoginLoad) {
                return SpinKitRotatingCircle(
                  color: context.read<ThemeCubit>().gettheme() == "Light"
                      ? Colors.black
                      : Colors.teal,
                  size: 50.0,
                );
              } else
                return ElevatedButton(
                    onPressed: () {
                      context.read<LogincubitCubit>().reload();
                    },
                    child: Text("Retry"));
            },
          )
        ]),
      ),
    );
  }
}
