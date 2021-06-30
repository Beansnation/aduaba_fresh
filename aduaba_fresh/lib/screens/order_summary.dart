import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_backspace,
              color: Colors.black,
              size: 35.0,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Order Summary',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreen.shade500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Your order code is Z38-9811-K9',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                '2 Items: total (including delivery) N32,000.00',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              progressBarInfo(Colors.amber, 'Order Placed on 26 July',
                  'We have received your oder', 90.0),
              progressBarInfo(
                  Colors.amber, 'Confirmed', 'Order accepted on 26 July', 90.0),
              progressBarInfo(
                  Colors.black, 'Order Shipped', 'Estimated for 3rd Aug', 90.0),
              progressBarInfo(
                  Colors.black, 'Delivered', 'Estimated for 3rd Aug', 0.0),
              //Spacer(),
              SizedBox(height: 90.0),
              Container(
                width: double.infinity,
                height: 45.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    showAlertDialog(context, 'Are you sure you want to delete?',
                        "AppName", "Ok", "Cancel");
                  },
                  child: Text(
                    'Cancel Order',
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

  Widget progressBarInfo(Color radioIconColor, String mainSummary,
      subTextSummary, double borderHeight) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            Icon(
              Icons.radio_button_checked_outlined,
              color: radioIconColor,
            ),
            SizedBox(width: 12),
            Text(
              mainSummary,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
              ),
            ),
          ],
        ),
        SizedBox(height: 7),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 9.0, vertical: 5.0),
              child: Container(
                width: 1,
                height: borderHeight,
                color: Colors.grey,
              ),
            ),
            SizedBox(width: 12),
            Text(
              subTextSummary,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(height: 7),
      ],
    );
  }

  showAlertDialog(BuildContext context, String message, String heading,
      String buttonAcceptTitle, String buttonCancelTitle) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text(buttonCancelTitle),
      onPressed: () {},
    );
    Widget continueButton = FlatButton(
      child: Text(buttonAcceptTitle),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(heading),
      content: Text(message),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
