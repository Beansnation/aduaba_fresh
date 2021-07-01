import 'package:flutter/material.dart';
import 'package:aduaba_fresh/model/style_refactor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'checkout_summary.dart';

class CheckoutConfirmed extends StatefulWidget {
  @override
  _CheckoutConfirmedState createState() => _CheckoutConfirmedState();
}

class _CheckoutConfirmedState extends State<CheckoutConfirmed> {
  int? _value = 2;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController additionalNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double stepper = MediaQuery.of(context).size.width / 2.6;
    String address1 =
        'For Contactless Delivery we recommend go cashless and stay with Aduabe Fresh Pay';
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
                    MaterialPageRoute(builder: (context) => Checkout()));
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
              Container(height: 4, width: stepper, color: primaryGreen),
              CircleAvatar(
                backgroundColor: primaryGreen,
                radius: 10,
              ),
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
                Size.fromHeight(MediaQuery.of(context).size.width / 2.5),
            child: tab),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/7),
              Image.asset('assets/images/cartConfirmed.png', scale: 3),
              SizedBox(height: MediaQuery.of(context).size.height/12),
              stylus('Order Confirmed', FontWeight.bold, 24,
                  alignment: TextAlign.center),
              SizedBox(height: 16),
              stylus(
                  'Thank you for choosing Aduaba Fresh. Your order #2345 has been confirmed',
                  FontWeight.w400,
                  20,
              alignment: TextAlign.center),
              SizedBox(height: 36),
              actionButton('Track Order', primaryGreen, primaryGreen, white),
              SizedBox(height: 16),
              actionButton('Continue Shopping', white, black, black)
            ],
          ),
        ));
  }
}
