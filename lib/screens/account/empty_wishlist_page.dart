import 'dart:ui';
import 'package:aduaba_fresh/model/style_refactor.dart';
import 'package:aduaba_fresh/screens/discover/discover.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import '../../widgets/bottom_navbar.dart';

class EmptyWishlistPage extends StatefulWidget {
  const EmptyWishlistPage({Key? key}) : super(key: key);

  @override
  _EmptyWishlistPageState createState() => _EmptyWishlistPageState();
}

class _EmptyWishlistPageState extends State<EmptyWishlistPage> {
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
                    stylus('My Wishlist', FontWeight.w700, 24,
                        textcolor: greenGrey),
                  ],
                ),
                SizedBox(height: 16.0),
                stylus('18 items listed', FontWeight.normal, 16,
                    textcolor: hintTextColor),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30),
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30.0),
              Image.asset(
                'assets/images/EmptyWishlist.png',
                fit: BoxFit.cover,
              ),
              SizedBox(height: 40.0),
              Text(
                'Your wishlist is empty',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Hit the three button down below to find interesting products',
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              Container(
                width: double.infinity,
                height: 45.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Discover()));
                  },
                  child: Text(
                    'Discover Products',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
