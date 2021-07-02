import 'dart:ui';
import 'package:aduaba_fresh/model/style_refactor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../bottom_navbar.dart';
import 'package:flutter_svg/svg.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardExpiryController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

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
          preferredSize: const Size.fromHeight(50.0),
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
                    stylus('Payment', FontWeight.w700, 24,
                        textcolor: greenGrey),
                  ],
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'My Cards',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset('assets/images/VisaLogo.png'),
                Text(
                  '1009 . . . .   . . . .  2017',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.trashAlt,
                      size: 16, color: hintTextColor),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset('assets/images/MastercardLogo.png', scale: 4),
                Text(
                  '1009 . . . .   . . . .  2017',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.trashAlt,
                      size: 16, color: hintTextColor),
                ),
              ],
            ),
            Spacer(),
            actionButton('Add New Card', primaryGreen, primaryGreen, white,
                ontap: () {
              onpressed();
            })
          ],
        ),
      ),
    );
  }

  onpressed() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return FractionallySizedBox(
              heightFactor: 1,
              child: Form(
                  child: ListView(padding: EdgeInsets.all(16), children: [
                SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    stylus('New Card', FontWeight.w700, 26,
                        textcolor: darkGreen),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close))
                  ],
                ),
                SizedBox(height: 18),
                SizedBox(
                  width: 250,
                  child: Container(
                      width: 250,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Color(0xFFE75A21),
                          borderRadius: BorderRadius.all(
                            Radius.circular(13),
                          )),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 20,
                            left: 40,
                            right: 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset('assets/svg/visa.svg'),
                                SizedBox(height: 32),
                                stylus(
                                    '3282     .  .  .  .     .  .  .  .    3282',
                                    FontWeight.w500,
                                    18,
                                    textcolor: white,
                                    letterspacing: 2),
                                SizedBox(height: 28),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      stylus('Card Holder', FontWeight.w500, 14,
                                          textcolor: white),
                                      stylus('Expires', FontWeight.w500, 14,
                                          textcolor: white),
                                    ]),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    stylus(
                                      //variables onchanged
                                        'Aycan Doganlar', FontWeight.w500, 18,
                                        textcolor: white),
                                    stylus('12/23', FontWeight.w600, 14,
                                        textcolor: white),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
                SizedBox(height: 24),
                stylus(
                  'Name on card',
                  FontWeight.w700,
                  16,
                ),
                SizedBox(height: 16),
                textInput(
                  'type full name',
                  nameController,
                  TextInputType.text,
                ),
                SizedBox(height: 16),
                stylus('Card Number', FontWeight.w700, 16),
                SizedBox(height: 16),
                textInput(
                    '16 digits', cardNumberController, TextInputType.number),
                SizedBox(height: 16),
                stylus('Expiry Date', FontWeight.w700, 16),
                SizedBox(height: 16),
                textInput(
                  'mm/yy',
                  cardExpiryController,
                  TextInputType.number,
                ),
                SizedBox(height: 16),
                stylus('CVV', FontWeight.w700, 16),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: textInput(
                      '3 digits', cvvController, TextInputType.number),
                ),
                SizedBox(height: 16),
                actionButton(
                  'Save',
                  primaryGreen,
                  primaryGreen,
                  white,
                  ontap: () {
                    Navigator.pop(context);
                  },
                ),
              ])));
        });
  }
}
