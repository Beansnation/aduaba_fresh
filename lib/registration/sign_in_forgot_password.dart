import 'package:flutter/material.dart';
import '../model/style_refactor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late FocusNode pin1FocusNode;
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  @override
  void initState() {
    super.initState();
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin1FocusNode.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }

  void nextField(FocusNode focusNode) {
    focusNode.requestFocus();
  }

  int? _selectedMethod = 1;
  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController code1 = TextEditingController();
    TextEditingController code2 = TextEditingController();
    TextEditingController code3 = TextEditingController();
    TextEditingController code4 = TextEditingController();

    void showAlertDialog(BuildContext context) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              content: Builder(
                builder: (context) {
                  return Container(
                      padding: EdgeInsets.all(8),
                      height: MediaQuery.of(context).size.height / 4.5,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          stylus('Your password has\nbeen reset',
                              FontWeight.w700, 26,
                              alignment: TextAlign.center),
                          SizedBox(height: 28),
                          actionButton(
                              'Sign in', primaryGreen, primaryGreen, white),
                        ],
                      ));
                },
              ),
            );
          });
    }

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 300,
                        child: stylus("Forgot Password\nto your account",
                            FontWeight.w700, 30)),
                    CircleAvatar(
                      backgroundColor: primaryGreen.withOpacity(0.1),
                      radius: 30,
                      child: Icon(Icons.shield, color: primaryGreen),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                stylus(
                    'Select what contact detail we use\nto reset your password',
                    FontWeight.w400,
                    20,
                    textcolor: hintTextColor),
                SizedBox(height: 16),
                buildListTile(1, FontAwesomeIcons.tablet, 'via sms:',
                    '. . .  . . . .  7767'),
                SizedBox(height: 24),
                buildListTile(2, Icons.mail, 'via email:',
                    '. . . . . . .  vid@gmail.com'),
              ],
            ),
            GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return FractionallySizedBox(
                          heightFactor: 0.6,
                          child: Form(
                            child: ListView(
                              padding: EdgeInsets.all(16),
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    stylus('Enter 4 Digits code',
                                        FontWeight.w700, 26,
                                        textcolor: darkGreen),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(Icons.close))
                                  ],
                                ),
                                SizedBox(height: 16),
                                stylus(
                                    'Enter the four digits code sent to\nyour email address',
                                    FontWeight.w400,
                                    20,
                                    textcolor: hintTextColor),
                                SizedBox(height: 16),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 235),
                                  child: Row(children: [
                                    buildVerifyPin(code1, (value) {
                                      nextField(pin2FocusNode);
                                    }, pin1FocusNode),
                                    SizedBox(width: 8),
                                    buildVerifyPin(code2, (value) {
                                      nextField(pin3FocusNode);
                                    }, pin2FocusNode),
                                    SizedBox(width: 8),
                                    buildVerifyPin(code3, (value) {
                                      nextField(pin4FocusNode);
                                    }, pin3FocusNode),
                                    SizedBox(width: 8),
                                    buildVerifyPin(code4, (value) {
                                      pin4FocusNode.unfocus();
                                    }, pin4FocusNode),
                                  ]),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (BuildContext context) {
                                            return FractionallySizedBox(
                                              heightFactor: 0.6,
                                              child: Form(
                                                child: ListView(
                                                  padding: EdgeInsets.all(16),
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        stylus('Reset Password',
                                                            FontWeight.w700, 26,
                                                            textcolor:
                                                                darkGreen),
                                                        GestureDetector(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Icon(
                                                                Icons.close))
                                                      ],
                                                    ),
                                                    SizedBox(height: 16),
                                                    stylus(
                                                        'Set the new password for your account\nso you can login and access the features',
                                                        FontWeight.w400,
                                                        20,
                                                        textcolor:
                                                            hintTextColor),
                                                    SizedBox(height: 16),
                                                    stylus(
                                                      'Password',
                                                      FontWeight.w700,
                                                      16,
                                                    ),
                                                    SizedBox(height: 16),
                                                    textInput(
                                                        'Enter Password',
                                                        passwordController,
                                                        TextInputType
                                                            .emailAddress,
                                                        iconSuffix: Icons
                                                            .remove_red_eye_rounded),
                                                    SizedBox(height: 16),
                                                    stylus('Confirm Password',
                                                        FontWeight.w700, 16),
                                                    SizedBox(height: 16),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 95.0),
                                                      child: textInput(
                                                          'Enter Password',
                                                          confirmPasswordController,
                                                          TextInputType
                                                              .visiblePassword,
                                                          iconSuffix: Icons
                                                              .remove_red_eye_rounded),
                                                    ),
                                                    GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                          showAlertDialog(
                                                              context);
                                                        },
                                                        child: actionButton(
                                                            'Save Password',
                                                            primaryGreen,
                                                            primaryGreen,
                                                            white))
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    child: actionButton('Continue',
                                        primaryGreen, primaryGreen, white))
                              ],
                            ),
                          ),
                        );
                      });
                },
                child:
                    actionButton('Continue', primaryGreen, primaryGreen, white))
          ],
        ),
      ),
    ));
  }

  ListTile buildListTile(
      int value, IconData icon, String title, String subtitle) {
    return ListTile(
      onTap: () {
        setState(() {});
      },
      contentPadding: EdgeInsets.only(left: 0),
      leading: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
              color: iconHolder,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: FaIcon(icon, color: iconGreen, size: 30)),
      title: stylus(title, FontWeight.w700, 18),
      subtitle: stylus(subtitle, FontWeight.w500, 14, textcolor: hintTextColor),
      trailing: Radio(
        activeColor: iconGreen,
        value: value,
        groupValue: _selectedMethod,
        onChanged: (int? value) {
          setState(() {
            _selectedMethod = value;
          });
        },
      ),
    );
  }
}
