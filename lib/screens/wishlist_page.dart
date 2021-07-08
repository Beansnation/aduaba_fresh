import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aduaba_fresh/model/style_refactor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aduaba_fresh/bottom_navbar.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
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
                stylus('18 items listed', FontWeight.normal, 16, textcolor: hintTextColor),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: getWishlistCard(),
      ),
    );
  }

  Widget getWishlistCard() {
    List items = ['1', '2', '3', '4', '5', '6'];
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return wishlistCard();
      },
    );
  }
  Padding wishlistCard() {
    return Padding(
      padding: const EdgeInsets.only(bottom :18.0),
      child: Row(
        children: [
          Image.asset('assets/images/Berry Powder.png', scale:.85),
          SizedBox(width: MediaQuery.of(context).size.width*0.042),
          Container(
              width: 230,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  stylus(
                      'Herbsconnect Organic Acai Berry Powder Freeze Dried',
                      FontWeight.w600,
                      16),
                  SizedBox(height: 10),
                  stylus('Emmanuel Produce', FontWeight.w500, 14,
                      textcolor: hintTextColor),
                  SizedBox(height: 10),
                  Row(

                    children: [
                      stylus('N35,000.00', FontWeight.w700, 14,
                          textcolor: orange),
                      SizedBox(width: 6.5),
                      stylus('.', FontWeight.w900, 14,
                          textcolor: hintTextColor),
                      SizedBox(width: 6.5),

                      stylus('In stock', FontWeight.w600, 16,
                          textcolor: darkGreen)
                    ],
                  )
                ],
              )),
          SizedBox(width: MediaQuery.of(context).size.width*0.011),
          Icon(
            FontAwesomeIcons.trashAlt,
            size: 18.0,
            color: hintTextColor,
          ),
        ],
      ),
    );
  }
}
