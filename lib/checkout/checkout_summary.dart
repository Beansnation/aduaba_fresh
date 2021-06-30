import 'package:flutter/material.dart';
import 'package:aduaba_fresh/style_refactor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {

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
            height: 40,
          ),
          Icon(Icons.keyboard_backspace, size: 35, color: black),
          SizedBox(height: 8),
          stylus('Checkout', FontWeight.w700, 24, textcolor: greenGrey),
        ],
      ),
    );
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.width / 3.6),
          child: tab),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              buildProductSummary(1),
              SizedBox(height: 24),
              Divider(color: hintTextColor, height: 1.5),
              SizedBox(height: 24),
              buildProductSummary(2),
              SizedBox(height: 16),
            ],
          ),
          Container(
            child: Positioned(
                top: MediaQuery.of(context).size.height * 6 / 11,
                left: 0.0,
                right: 0.0,
                child: BottomFloat()),
          ),
        ],
      ),
    );
  }

  Row buildProductSummary(int num) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: 250,
            margin: EdgeInsets.only(right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(height:12),
                stylus(
                  'Herbsconnect Organic Acai Berry Powder Freeze Dried',
                  FontWeight.w700,
                  18,
                ),
                SizedBox(height: 4),
                stylus('Emmanuel Produce', FontWeight.w500, 13,
                    textcolor: hintTextColor),
                SizedBox(height: 8),
                stylus('Quantity: 5', FontWeight.w500, 13,
                    textcolor: hintTextColor),
                SizedBox(height: 8),
                Row(
                  children: [
                    stylus('N35,000.00', FontWeight.w700, 16,
                        textcolor: orange),
                    SizedBox(width: 16),
                    stylus('In stock', FontWeight.w600, 16,
                        textcolor: darkGreen)
                  ],
                ),
              ],
            )),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(2))),
            child: Image.asset('assets/images/summary$num.png', scale: 3.5))
      ],
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
                  stylus('Delivery', FontWeight.w500, 16),
                  stylus('N350.00', FontWeight.w500, 16),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  stylus('Order', FontWeight.w500, 16),
                  stylus('N35,000.00', FontWeight.w500, 16)
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  stylus('Summary', FontWeight.w800, 18),
                  stylus('N35,350.00', FontWeight.w800, 18)
                ],
              ),
              SizedBox(height: 24),
              actionButton('Continue', primaryGreen, primaryGreen, white)
            ],
          ),
        ));
  }
}
