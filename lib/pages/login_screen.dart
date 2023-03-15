import 'package:flutter/material.dart';
import 'package:myapp/pages/dash_board_screen.dart';
import 'package:myapp/services/alert_dialogue.dart';
import 'package:myapp/services/exit_pop_services.dart';
import 'package:myapp/services/form_validation.dart';
import 'package:myapp/services/page_navigate_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Form(
            key: _formKey,
            child: Container(
              height: _height,
              width: _width,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.close),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(labelText: "E-mail"),
                          controller: emailCtrl,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "TextField is empty";
                            } else if (value.length < 6) {
                              return "Textfield must be more than 5 chars";
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(labelText: "Password"),
                          controller: passCtrl,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password is empty";
                            } else if (value.length < 9) {
                              return "Pasword must be more than 8 chars";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (validateAndSave(_formKey)) {
                            navigateToNextScreen(
                                context, ExitPopUpService(DashBoardScreen()));
                            print("Logged In");
                          } else {
                            print("Not Logged In");
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 26,
                          ),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ),
                          fixedSize: MaterialStateProperty.all<Size>(
                              Size(_width / 2, 50)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blueGrey),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Facebook",
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.blueGrey,
                          ),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                width: 2,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          fixedSize: MaterialStateProperty.all<Size>(
                              Size(_width / 2, 50)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Google",
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.redAccent,
                          ),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                width: 2,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                          fixedSize: MaterialStateProperty.all<Size>(
                              Size(_width / 2, 50)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text("Forget Password ?"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
