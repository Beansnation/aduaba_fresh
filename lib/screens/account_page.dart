import 'dart:ui';
import 'package:aduaba_fresh/model/style_refactor.dart';
import 'package:aduaba_fresh/registration/sign_in.dart';
import 'package:aduaba_fresh/screens/payment_page.dart';
import 'package:aduaba_fresh/screens/wishlist_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'edit_account.dart';
import 'orders_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
                    stylus('Account', FontWeight.w700, 24,
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
            children: [
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Profile.png'),
                    radius: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        stylus('Andrea Charles', FontWeight.bold, 18),
                        SizedBox(height: 8.0),
                        Text('Andrea_charles@gmail.com'),
                        SizedBox(height: 8.0),
                        Text('+234 809 202 3024'),
                      ],
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.edit_outlined),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditAccountPage()));
                    },
                  ),
                ],
              ),
              SizedBox(height: 35.0),
              GestureDetector(
                onTap: () {},
                child: accountOptions(Icons.favorite, Colors.red, 'My wishlist',
                    ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WishlistPage()));
                }),
              ),
              Divider(),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrderPage()));
                },
                child: accountOptions(Icons.shopping_cart_rounded,
                    Colors.deepOrange, 'My orders'),
              ),
              Divider(),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaymentPage()));
                },
                child: accountOptions(
                    Icons.credit_card_outlined, Colors.green, 'Payments'),
              ),
              Divider(),
              GestureDetector(
                onTap: () {},
                child: accountOptions(
                    Icons.electric_rickshaw, Colors.amber, 'Shipping details'),
              ),
              Divider(),
              GestureDetector(
                onTap: () {},
                child: accountOptions(
                    Icons.settings_sharp, Colors.blueGrey, 'Settings'),
              ),
              SizedBox(
                height: 45.0,
              ),
              actionButton('Log out', red, red, white, ontap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget accountOptions(var iconType, var iconColor, String title, {ontap}) {
    return ListTile(
      onTap: ontap,
      minLeadingWidth: 15,
      leading: Icon(
        iconType,
        color: iconColor,
      ),
      title: Text(title),
    );
  }
}
