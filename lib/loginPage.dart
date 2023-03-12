import 'package:automobile_doctor/customButton.dart';
import 'package:automobile_doctor/customTextField.dart';
import 'package:automobile_doctor/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:automobile_doctor/signupForm.dart';
import 'package:flutter/material.dart';
import 'landingScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final _auth = FirebaseAuth.instance;

class _LoginScreenState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void signUserIn() async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      }
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
          );
        });
  }

  String _errorMessage = "";

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "Email can not be empty";
      });
    } /* else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    } */
    else {
      setState(() {
        _errorMessage = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
        shrinkWrap: true,
        reverse: true,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Container(
                    height: 550,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.red[50], //HexColor("#ffffff"),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Log In",
                            style: GoogleFonts.poppins(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: HexColor("#4f4f4f"),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: HexColor("#8d8d8d"),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                MyTextField(
                                  onChanged: (() {
                                    validateEmail(emailController.text);
                                  }),
                                  controller: emailController,
                                  hintText: "hello@gmail.com",
                                  obscureText: false,
                                  prefixIcon: const Icon(Icons.mail_outline),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Text(
                                    _errorMessage,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Password",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: HexColor("#8d8d8d"),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                MyTextField(
                                  controller: passwordController,
                                  hintText: "**************",
                                  obscureText: true,
                                  prefixIcon: const Icon(Icons.lock_outline),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                MyButton(
                                  onPressed: signUserIn,
                                  buttonText: 'Submit',
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(35, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Text("Don't have an account?",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            color: HexColor("#8d8d8d"),
                                          )),
                                      TextButton(
                                        child: Text(
                                          "Sign Up",
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            color: HexColor("#44564a"),
                                          ),
                                        ),
                                        onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    RegistrationScreen())),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(100, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      TextButton(
                                        child: Text(
                                          "Back to Home",
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            color: HexColor("#44564a"),
                                          ),
                                        ),
                                        onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    LandingScreen())),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
