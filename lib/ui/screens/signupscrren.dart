import 'package:flutter/material.dart';
import 'package:researchapp/ui/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final usernamekey = GlobalKey<FormState>();
  final passwordkey = GlobalKey<FormState>();
  final emailkey = GlobalKey<FormState>();
  final pwdckey = GlobalKey<FormState>();

  final usernamecont = TextEditingController();
  final pwdcontroller = TextEditingController();
  final pwdccontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final txtcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarr,
      floatingActionButton: FloatingActionButtonn(context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Form(
              key: emailkey,
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email :"),
                      TextFormField(
                        controller: emailcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Please enter some text';
                          else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) return "Email is invalid!";
                          return null;
                        },
                      ),
                    ],
                  )),
            ),
            Form(
              key: usernamekey,
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("User Name :"),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Please enter some text';
                          else if (value.length < 6)
                            return "Enter a longer username";
                          return null;
                        },
                        controller: usernamecont,
                      ),
                    ],
                  )),
            ),
            Form(
              key: passwordkey,
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Password :"),
                      TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Please enter some text';
                          else if (value.length < 6)
                            return "Enter a longer password";
                          return null;
                        },
                        controller: pwdcontroller,
                      ),
                    ],
                  )),
            ),
            Form(
              key: pwdckey,
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Confirm Password :"),
                      TextFormField(
                        obscureText: true,
                        controller: pwdccontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Please enter some text';
                          else if (value.length < 6)
                            return "Enter a longer password";
                          else if (pwdccontroller.value.text !=
                              pwdcontroller.value.text)
                            return "Passwords dont match";
                          return null;
                        },
                      ),
                    ],
                  )),
            ),
            Container(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  if (emailkey.currentState!.validate()) {
                    if (usernamekey.currentState!.validate()) {
                      if (passwordkey.currentState!.validate()) {
                        if (pwdckey.currentState!.validate()) {
                          print(usernamecont.value.text);
                        }
                      }
                    }
                  }
                },
                child: Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}
