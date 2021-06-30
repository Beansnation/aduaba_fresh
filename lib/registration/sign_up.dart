import 'package:aduaba_fresh/registration/sign_in.dart';
import 'package:flutter/material.dart';
import '../style_refactor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aduaba_fresh/home_screen.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _key = GlobalKey<FormState>();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
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
                        width: 200,
                        child: stylus(
                            'Create\nyour account', FontWeight.w700, 30)),
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
                textInput('minimum of 6 characters', passwordController,
                    TextInputType.visiblePassword),
                SizedBox(height: 16),
                stylus('Confirm Password', FontWeight.w700, 16),
                SizedBox(height: 16),
                textInput('retype password', confirmPasswordController,
                    TextInputType.visiblePassword),
                SizedBox(height: 20),
                actionButton('Create Account', primaryGreen, primaryGreen, white, ontap: (){Navigator.push(context, MaterialPageRoute(builder:(context)=>Home()));} ),
                SizedBox(height: 16),
                Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        stylus('Have an account already?', FontWeight.w500, 16),
                        SizedBox(width: 4.0),
                        GestureDetector(
                          child: stylus('Sign in', FontWeight.w700, 16,
                              textcolor: primaryGreen),
                          onTap: (){Navigator.push(context, MaterialPageRoute(builder:(context)=>SignIn()));}
                        )
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
