import 'package:aduaba_fresh/model/style_refactor.dart';
import 'package:flutter/material.dart';

import '../bottom_navbar.dart';

class EmptyOrder extends StatefulWidget {
  const EmptyOrder({Key? key}) : super(key: key);

  @override
  _EmptyOrderState createState() => _EmptyOrderState();
}

class _EmptyOrderState extends State<EmptyOrder> {
  @override
  void initState() {
    index = 2;
    super.initState();
  }
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
          preferredSize: const Size.fromHeight(75.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    stylus('My Orders', FontWeight.w700, 24,
                        textcolor: greenGrey),
                  ],
                ),
                SizedBox(height: 16.0),
                stylus('0 items listed', FontWeight.normal, 16,
                    textcolor: hintTextColor),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:  BottomNav(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30),
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30.0),
              Image.asset(
                'assets/images/EmptyOrder.png',
                fit: BoxFit.cover,
              ),
              SizedBox(height: 40.0),
              Text(
                'No orders yet',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Hit the three button down below to create an order',
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              actionButton('Start Ordering', primaryGreen,primaryGreen, white)
            ],
          ),
        ),
      ),
    );
  }
}
