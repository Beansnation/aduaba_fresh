import 'package:aduaba_fresh/checkout/checkout_confirmed.dart';
import 'package:flutter/material.dart';
import 'package:aduaba_fresh/model/style_refactor.dart';
import 'checkout_address.dart';
import 'checkout_card.dart';

class CheckoutPayment extends StatefulWidget {
  @override
  _CheckoutPaymentState createState() => _CheckoutPaymentState();
}

class _CheckoutPaymentState extends State<CheckoutPayment> {
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
        body: Stack(children: [
          ListView(padding: EdgeInsets.all(16), children: [
            SizedBox(height: 16),
            stylus('Payment', FontWeight.w700, 26),
            SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  stylus('Cash on Delivery', FontWeight.bold, 18),
                  SizedBox(height: 4),
                  stylus(address1, FontWeight.w500, 16,
                      textcolor: hintTextColor)
                ],
              ),
              trailing: buildRadio(1),
              subtitle: Row(
                children: [
                  SizedBox(height: 60),
                  stylus('MORE DETAILS', FontWeight.w600, 16, decoration: TextDecoration.underline),
                  SizedBox(width: 4),
                  Icon(Icons.add)
                ],
              ),
            ),
            SizedBox(height: 32),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: stylus('Card Payment', FontWeight.bold, 18),
              trailing: buildRadio(2),
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
                      'Pay Now', primaryGreen, primaryGreen, white,
                      ontap: () {_value == 1 ? Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckoutConfirmed())):Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckoutCard())); }),
                )),
          )
        ]));
  }

  Radio<int> buildRadio( int value) {
    return Radio(
              activeColor: orange,
              splashRadius: 30,
              value: value,
              groupValue: _value,
              onChanged: (int? value) {
                setState(() {
                  _value = value;
                });
              },
            );
  }
}
