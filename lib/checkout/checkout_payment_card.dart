import 'package:flutter/material.dart';
import 'package:aduaba_fresh/style_refactor.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'checkout_payment.dart';
//import 'package:scroll_snap_list/scroll_snap_list.dart';

class CheckoutPaymentCard extends StatefulWidget {
  @override
  _CheckoutPaymentCardState createState() => _CheckoutPaymentCardState();
}

class _CheckoutPaymentCardState extends State<CheckoutPaymentCard> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController additionalNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();

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
              child: Icon(FontAwesomeIcons.arrowLeft, color: black)),
          SizedBox(height: 16),
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
                Size.fromHeight(MediaQuery.of(context).size.width / 2),
            child: tab),
        body: Stack(children: [
          ListView(padding: EdgeInsets.all(16), children: [
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                stylus('Payment', FontWeight.w700, 26),
                Row(
                  children: [
                    Icon(Icons.add, color: blackGrey),
                    stylus('Add New Card', FontWeight.w400, 16,
                        textcolor: blackGrey)
                  ],
                )
              ],
            ),
            SizedBox(height: 16),
            Container(
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
                      left: 20,
                      child: SvgPicture.asset('assets/svg/visa.svg'),
                    )
                  ],
                ))
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
                    onpressed();
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
                  'Search product',
                  nameController,
                  TextInputType.text,
                ),
                SizedBox(height: 16),
                stylus('Card Number', FontWeight.w700, 16),
                SizedBox(height: 16),
                textInput('+234', numberController, TextInputType.number),
                SizedBox(height: 16),
                stylus('Expiry Date', FontWeight.w700, 16),
                SizedBox(height: 16),
                textInput(
                  '+234',
                  additionalNumberController,
                  TextInputType.number,
                ),
                SizedBox(height: 16),
                stylus('CVV', FontWeight.w700, 16),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: textInput(
                      'Input address', addressController, TextInputType.text),
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
