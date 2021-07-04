import 'dart:ui';

import 'package:aduaba_fresh/model/style_refactor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({Key? key}) : super(key: key);

  @override
  _EditAccountPageState createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_backspace,
            color: Colors.black,
            size: 35.0,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    stylus('Edit Profile', FontWeight.w700, 24,
                        textcolor: greenGrey),
                  ],
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 35.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18),
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      ExactAssetImage('assets/images/ProfilePicChange.png'),
                  radius: 52.0,
                ),
              ),
              SizedBox(height: 48.0),
              textTitleAndField('First Name', 'Andrea', firstNameController),
              textTitleAndField('Last Name', 'Charles', lastNameController),
              textTitleAndField(
                  'Phone Number', '+234', phoneController,
                  type: TextInputType.number),
              SizedBox(height: 48),
              actionButton('Save Changes', primaryGreen, primaryGreen, white,
                  ontap: () {})
            ],
          ),
        ),
      ),
    );
  }

  Widget textTitleAndField(String titleName, hintTextName, controller, {type}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15.0),
        TextField(
          keyboardType: type,
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              hintStyle: TextStyle(color: hintTextColor),
              hintText: hintTextName,
              fillColor: Colors.grey[100]),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
