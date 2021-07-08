import 'dart:convert';

import 'package:aduaba_fresh/registration/sign_in_forgot_password.dart';
import 'package:aduaba_fresh/registration/sign_up.dart';
import 'package:flutter/material.dart';
import '../model/style_refactor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aduaba_fresh/home_screen.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _key = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 300,
                        child: stylus(
                            "Sign in\nto your account", FontWeight.w700, 30)),
                    CircleAvatar(
                      backgroundColor: primaryGreen.withOpacity(0.1),
                      radius: 30,
                      child: Icon(Icons.person, color: primaryGreen),
                    )
                  ],
                ),
                SizedBox(height: 40),
                stylus('Email Address', FontWeight.w700, 16),
                SizedBox(height: 16),
                textInput('input your email address', emailController,
                    TextInputType.emailAddress),
                SizedBox(height: 16),
                stylus('Password', FontWeight.w700, 16),
                SizedBox(height: 16),
                textInput('input your password', passwordController,
                    TextInputType.visiblePassword,
                    obscure: true, iconSuffix: Icons.remove_red_eye_rounded),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ForgotPassword()));
                      },
                      child: stylus('Forgot Password?', FontWeight.w600, 16,
                          textcolor: greenGrey),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                actionButton('Login', primaryGreen, primaryGreen, white,
                    ontap: () {
                      login();
                }),
                SizedBox(height: 16),
                Center(
                    child: stylus(
                        '-OR SIGN IN WITH SOCIALS-', FontWeight.w400, 14)),
                SizedBox(height: 16),
                ctaButton(
                  'Sign in Apple ID',
                  black,
                  FontAwesomeIcons.apple,
                  black,
                  white,
                  white,
                  onPressed: () {},
                ),
                SizedBox(height: 16),
                ctaButton(
                  'Register with Google',
                  white,
                  FontAwesomeIcons.google,
                  black,
                  black,
                  black,
                  onPressed: () {},
                ),
                SizedBox(height: 16),
                ctaButton(
                  'Register with Facebook',
                  facebook,
                  FontAwesomeIcons.facebookF,
                  facebook,
                  white,
                  white,
                  onPressed: () {},
                ),
                SizedBox(height: 16),
                Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        stylus("Don't have an account?", FontWeight.w500, 16),
                        SizedBox(width: 4.0),
                        GestureDetector(
                            child: stylus('Get Started', FontWeight.w600, 16,
                                textcolor: primaryGreen),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            })
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //FUNCTION TO CALL LOGIN API
  Future<void> login() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse(
              "https://aduabawebapi.azurewebsites.net/api/User/UserLogin"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'email': emailController.text,
            'password': passwordController.text
          }));
      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Invalid Credentials')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Blank field not allowed')));
    }
  }
}
