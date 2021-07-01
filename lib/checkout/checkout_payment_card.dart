import 'package:flutter/material.dart';
import 'package:aduaba_fresh/model/style_refactor.dart';
import 'package:flutter_svg/svg.dart';
import'checkout_confirmed.dart';
import 'checkout_payment.dart';
//import 'package:scroll_snap_list/scroll_snap_list.dart';

class CheckoutPaymentCard extends StatefulWidget {
  @override
  _CheckoutPaymentCardState createState() => _CheckoutPaymentCardState();
}

class _CheckoutPaymentCardState extends State<CheckoutPaymentCard> {
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardExpiryController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  List<int> data = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];

  Widget _buildItemList(BuildContext context, int index) {
    if (index == data.length)
      return Center(
        child: CircularProgressIndicator(),
      );
    return Container(
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.yellow,
            width: 150,
            height: 200,
            child: Center(
              child: Text(
                '${data[index]}',
                style: TextStyle(fontSize: 50.0, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double stepper = MediaQuery.of(context).size.width / 2.6;
    final tab = Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: white, boxShadow: [
        BoxShadow(
            color: black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 20,
            offset: Offset(0, 2))
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 36,
          ),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CheckoutPayment()));
              },
              child: Icon(Icons.keyboard_backspace,size: 35, color: black)),
          SizedBox(height: 10),
          stylus('Checkout', FontWeight.w700, 24, textcolor: greenGrey),
          SizedBox(height: 16),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: primaryGreen,
                radius: 10,
              ),
              Container(height: 4, width: stepper, color: primaryGreen),
              CircleAvatar(
                backgroundColor: primaryGreen,
                radius: 10,
              ),
              Container(height: 4, width: stepper, color: stepperColor),
              CircleAvatar(
                  backgroundColor: stepperColor,
                  radius: 10,
                  child: CircleAvatar(
                    backgroundColor: white,
                    radius: 7,
                  )),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              stylus('Billing', FontWeight.normal, 16, textcolor: stepperColor),
              SizedBox(width: 8),
              stylus('Payment', FontWeight.normal, 16, textcolor: stepperColor),
              stylus('Confirmation', FontWeight.normal, 16,
                  textcolor: stepperColor)
            ],
          )
        ],
      ),
    );
    return Scaffold(
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.width / 2.6),
            child: tab),
        body: Stack(children: [
          ListView(padding: EdgeInsets.all(16), children: [
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                stylus('Payment', FontWeight.w700, 26),
                GestureDetector(
                  child: Row(
                    children: [
                      Icon(Icons.add, color: blackGrey),
                      stylus('Add New Card', FontWeight.w400, 16,
                          textcolor: blackGrey)
                    ],
                  ),
                  onTap: (){onpressed();},
                )
              ],
            ),
            SizedBox(height: 16),
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
                            stylus('3282     .  .  .  .     .  .  .  .    3282',
                                FontWeight.w500, 18,
                                textcolor: white, letterspacing: 2),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                stylus('Aycan Doganlar', FontWeight.w500, 18,
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
            )
          ]),
          Positioned(
            top: MediaQuery.of(context).size.height * 8 / 13,
            left: 0.0,
            right: 0.0,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: white,
                  child: actionButton(
                      'Pay Now', primaryGreen, primaryGreen, white, ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CheckoutConfirmed()));
                  }),
                )),
          )
        ]));
  }

  onpressed() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return FractionallySizedBox(
              heightFactor: 0.75,
              child: Form(
                  child: ListView(padding: EdgeInsets.all(16), children: [
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
                SizedBox(height: 16),
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
                textInput('16 digits', cardNumberController, TextInputType.number),
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
