import 'dart:ui';
import 'package:aduaba_fresh/model/style_refactor.dart';
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
                    stylus('Order Summary', FontWeight.w700, 24,
                        textcolor: greenGrey),
                  ],
                ),
                SizedBox(height: 16.0),
                stylus('18 items listed', FontWeight.normal, 16,
                    textcolor: hintTextColor),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 36.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              stylus(
                'Your order code is Z38-9811-K9',
                FontWeight.w700,
                18,
                textcolor: stepperColor,
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
                  'We have received your oder', 64.0),
              progressBarInfo(
                  Colors.amber, 'Confirmed', 'Order accepted on 26 July', 64.0),
              progressBarInfo(
                  Colors.black, 'Order Shipped', 'Estimated for 3rd Aug', 64.0),
              progressBarInfo(
                  Colors.black, 'Delivered', 'Estimated for 3rd Aug', 0.0),
              //Spacer(),
              SizedBox(height: 72.0),
              actionButton(
                'Cancel Order',
                fuschiaPink,
                fuschiaPink,
                white,
                ontap: () {
                  showAlertDialog(context);
                },
              )
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
            SizedBox(width: 20),
            Text(
              mainSummary,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
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
            SizedBox(width: 26),
            Text(
              subTextSummary,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(height: 7),
      ],
    );
  }

  // showAlertDialog(BuildContext context, Text message, Text heading,
  //     String buttonAcceptTitle, String buttonCancelTitle) {
  //   // set up the buttons
  //   Widget cancelButton = TextButton(
  //     child: Text(buttonCancelTitle),
  //     onPressed: () {},
  //   );
  //   Widget continueButton = TextButton(
  //     child: Text(buttonAcceptTitle),
  //     onPressed: () {},
  //   );
  //
  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: heading,
  //     content: message,
  //     actions: [
  //       cancelButton,
  //       continueButton,
  //     ],
  //   );
  //
  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }
  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            content: Builder(
              builder: (context) {
                return Container(
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height / 2.8,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        stylus('Cancel Order', FontWeight.w900, 26,
                            alignment: TextAlign.center),
                        SizedBox(height: 16),
                        stylus(
                            'Cancelling this order Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean hendrerit vel neque eget ultrices. ',
                            FontWeight.w400,
                            16,textcolor: hintTextColor,
                            alignment: TextAlign.center),
                        SizedBox(height: 24),
                        actionButton('Yes, Cancel Order', fuschiaPink,
                            fuschiaPink, white),
                        SizedBox(height: 16),
                        actionButton(
                            "No, Don't Cancel Order", white, black, black, ontap: (){
                              Navigator.pop(context);
                        }),
                      ],
                    ));
              },
            ),
          );
        });
  }
}
