import 'package:flutter/material.dart';
import 'package:researchapp/logic/logincubit/logincubit_cubit.dart';
import 'package:researchapp/ui/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          BlocBuilder<LogincubitCubit, LogincubitState>(
            builder: (context, state) {
              return ElevatedButton(
                  onPressed: () {
                    if (usernamekey.currentState!.validate()) {
                      if (passwordkey.currentState!.validate()) {
                        //you are cool to continue
                        context.read<LogincubitCubit>().login(
                            userfield.value.toString(),
                            pwdfield.value.toString());
                      }
                    }
                  },
                  child: Text("Submit"));
            },
          )
        ]),
      ),
    );
  }
}
