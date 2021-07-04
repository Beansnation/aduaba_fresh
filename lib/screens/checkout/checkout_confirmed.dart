import 'package:aduaba_fresh/screens/discover/discover.dart';
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
    final tab = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            preferredSize: const Size.fromHeight(100.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      stylus('Checkout', FontWeight.w700, 24,
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              //SizedBox(height: MediaQuery.of(context).size.height/9),
              Spacer(),
              Image.asset('assets/images/cartConfirmed.png', scale: 3),
              SizedBox(height: MediaQuery.of(context).size.height / 12),
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
              actionButton('Continue Shopping', white, black, black, ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Discover()));
              })
            ],
          ),
        ));
  }
}
