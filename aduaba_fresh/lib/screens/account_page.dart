import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_backspace,
              color: Colors.black,
              size: 35.0,
            ),
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
                    Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreen.shade500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
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
                        Text(
                          'Andrea Charles',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 35.0),
              GestureDetector(
                onTap: () {},
                child:
                    accountOptions(Icons.favorite, Colors.red, 'My wishlist'),
              ),
              Divider(),
              GestureDetector(
                onTap: () {},
                child: accountOptions(Icons.shopping_cart_rounded,
                    Colors.deepOrange, 'My orders'),
              ),
              Divider(),
              GestureDetector(
                onTap: () {},
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
              Container(
                width: double.infinity,
                height: 45.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () {},
                  child: Text('Log Out'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget accountOptions(var iconType, var iconColor, String title) {
    return ListTile(
      onTap: () {},
      minLeadingWidth: 15,
      leading: Icon(
        iconType,
        color: iconColor,
      ),
      title: Text(title),
    );
  }
}
