import 'dart:convert';

import 'package:aduaba_fresh/registration/sign_in.dart';
import 'package:flutter/material.dart';
import '../model/style_refactor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aduaba_fresh/home_screen.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _key = GlobalKey<FormState>();
  Future<Register>? _futureRegister;
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword1 = true;
  bool showPassword2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: (_futureRegister == null) ? buildRegister() : buildFutureBuilder(),
    ));
  }

  Future<Register> registerUser(
      String firstName, lastName, email, password, confirmPassword) async {
    final response = await http.post(
      Uri.parse("https://aduabawebapi.azurewebsites.net/api/User/RegisterUser"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Charset': 'utf-8'
      },
      body: jsonEncode(<String, String>{
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "confirmPassword": confirmPasswordController.text
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 CREATED response,
      // then parse the JSON.
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignIn()));
      return Register.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create user.');
    }
  }

  Form buildRegister() {
    return Form(
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
                      width: 200,
                      child:
                          stylus('Create\nyour account', FontWeight.w700, 30)),
                  CircleAvatar(
                    backgroundColor: primaryGreen.withOpacity(0.1),
                    radius: 30,
                    child: Icon(Icons.person, color: primaryGreen),
                  )
                ],
              ),
              SizedBox(height: 40),
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
              Center(
                  child:
                      stylus('-OR REGISTER WITH MAIL-', FontWeight.w400, 14)),
              SizedBox(height: 16),
              stylus('First Name', FontWeight.w700, 16),
              SizedBox(height: 16),
              textInput('input your first name', firstNameController,
                  TextInputType.text),
              SizedBox(height: 16),
              stylus('Last Name', FontWeight.w700, 16),
              SizedBox(height: 16),
              textInput('input your last name', lastNameController,
                  TextInputType.text),
              SizedBox(height: 16),
              stylus('Email Address', FontWeight.w700, 16),
              SizedBox(height: 16),
              textInput('input your email address', emailController,
                  TextInputType.emailAddress),
              SizedBox(height: 16),
              stylus('Password', FontWeight.w700, 16),
              SizedBox(height: 16),
              textInput(
                'minimum of 6 characters',
                passwordController,
                TextInputType.visiblePassword,
                obscure: showPassword1,
                onpressed: () {
                  setState(() {
                    if (showPassword1 == false) {
                      showPassword1 = true;
                    } else {
                      showPassword1 = false;
                    }
                  });
                },
                iconSuffix: Icons.remove_red_eye_rounded,
              ),
              SizedBox(height: 16),
              stylus('Confirm Password', FontWeight.w700, 16),
              SizedBox(height: 16),
              textInput(
                'retype password',
                confirmPasswordController,
                TextInputType.visiblePassword,
                obscure: showPassword2,
                onpressed: () {
                  setState(() {
                    if (showPassword2 == false) {
                      showPassword2 = true;
                    } else {
                      showPassword2 = false;
                    }
                  });
                },
                iconSuffix: Icons.remove_red_eye_rounded,
              ),
              SizedBox(height: 20),
              actionButton('Create Account', primaryGreen, primaryGreen, white,
                  ontap: () {
                setState(() {
                  _futureRegister = registerUser(
                      firstNameController.text,
                      lastNameController.text,
                      emailController.text,
                      passwordController.text,
                      confirmPasswordController.text);
                });
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Home()));
              }),
              SizedBox(height: 16),
              Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  stylus('Have an account already?', FontWeight.w500, 16),
                  SizedBox(width: 4.0),
                  GestureDetector(
                      child: stylus('Sign in', FontWeight.w700, 16,
                          textcolor: primaryGreen),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      })
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<Register> buildFutureBuilder() {
    return FutureBuilder<Register>(
      future: _futureRegister,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text(snapshot.data!.firstName),
              Text(snapshot.data!.lastName),
              Text(snapshot.data!.email),
              Text(snapshot.data!.password),
              Text(snapshot.data!.confirmPassword),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return CircularProgressIndicator();
      },
    );
  }
}

class Register {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;

  Register(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.confirmPassword});

  factory Register.fromJson(Map<String, dynamic> json) {
    return Register(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
    );
  }
}
