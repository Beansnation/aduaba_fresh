import 'package:aduaba_fresh/discover/discover.dart';
import 'package:flutter/material.dart';
import '../model/style_refactor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aduaba_fresh/checkout/checkout_summary.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool _checkBoxVal = true;
  bool _checkBoxVal1 = false;
  bool _checkBoxVal2 = true;
  bool _checkBoxVal3 = false;
  @override
  Widget build(BuildContext context) {
    final tab = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        stylus('18 items listed', FontWeight.w500, 15,
            textcolor: hintTextColor),
        Row(
          children: [
            Icon(
              Icons.check,
              color: hintTextColor,
            ),
            stylus('Select All', FontWeight.w500, 15,
                textcolor: hintTextColor),
          ],
        ),
        Row(
          children: [
            Icon(FontAwesomeIcons.trashAlt,
                size: 16, color: hintTextColor),
            stylus('Delete Selected', FontWeight.w500, 15,
                textcolor: hintTextColor),
          ],
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: Colors.white,
        leading: SizedBox(
          height: 35,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_backspace,
              color: Colors.black,
              size: 35.0,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    stylus('Cart', FontWeight.w700, 24,
                        textcolor: greenGrey),
                  ],
                ),
                SizedBox(height: 16.0),
                tab,
                SizedBox(height: 16.0),

              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      cartCard(
                              (bool value) {
                        setState(() {
                          this._checkBoxVal = value;
                        });
                      },
                          this._checkBoxVal,
                          'Herbsconnect Organic\nAcai Berry Powder Freeze\nDried',
                          'Emmanuel Produce',
                          'N35,000.00',
                          'assets/images/cart1.png'),
                      SizedBox(height: 16),
                      cartCard((bool value) {
                        setState(() {
                          this._checkBoxVal1 = value;
                        });
                      },
                          this._checkBoxVal1,
                          'Herbsconnect Organic\nAcai Berry Powder Freeze\nDried',
                          'Emmanuel Produce',
                          'N35,000.00',
                          'assets/images/cart2.png'),
                      SizedBox(height: 16),
                      cartCard((bool value) {
                        setState(() {
                          this._checkBoxVal2 = value;
                        });
                      },
                          this._checkBoxVal2,
                          'Herbsconnect Organic\nAcai Berry Powder Freeze\nDried',
                          'Emmanuel Produce',
                          'N35,000.00',
                          'assets/images/cart2.png'),
                      SizedBox(height: 16),
                      cartCard((bool value) {
                        setState(() {
                          this._checkBoxVal3 = value;
                        });
                      },
                          this._checkBoxVal3,
                          'Herbsconnect Organic\nAcai Berry Powder Freeze\nDried',
                          'Emmanuel Produce',
                          'N35,000.00',
                          'assets/images/cart2.png'),
                      Container(
                        child: Positioned(
                            top: MediaQuery.of(context).size.height * 6 / 11,
                            left: 0.0,
                            right: 0.0,
                            child: BottomFloat()
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height * 5.5 / 11,
                left: 0.0,
                right: 0.0,
                child: BottomFloat()),
          ],
        ),
      ),
    );
  }
}

class BottomFloat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.all(16),
          color: white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  stylus('Total 2 Items', FontWeight.w500, 16,
                      textcolor: hintTextColor),
                  stylus('N35,000', FontWeight.w800, 16),
                ],
              ),
              SizedBox(height: 16),
              actionButton(
                  'Proceed to Checkout', primaryGreen, primaryGreen, white, ontap: (){Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Checkout()));}),
              SizedBox(height: 16),
              actionButton('Continue Shopping', white, black, black, ontap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Discover()));
              })
            ],
          ),
        ));
  }
}
