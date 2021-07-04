import 'package:flutter/material.dart';
import 'package:aduaba_fresh/model/style_refactor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'checkout_summary.dart';
import 'checkout_payment.dart';

class CheckoutAddress extends StatefulWidget {
  @override
  _CheckoutAddressState createState() => _CheckoutAddressState();
}

class _CheckoutAddressState extends State<CheckoutAddress> {
  int? _value = 1;
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
        'Railway Quarters, tejuosho, Surulere, Lagos\nSurulere (Ojuelegba), Lagos\n+2348074057767';
    String address2 =
        'Railway Road, tejuosho, Ikeja, Lagos,\nIkeja (Underbridge), Lagos\n+2348074057767';

    final tab = Container(

      child: Column(
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
                  backgroundColor: stepperColor,
                  radius: 10,
                  child: CircleAvatar(
                    backgroundColor: white,
                    radius: 7,
                  )),
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
          ListView(
            padding: EdgeInsets.all(16),
            children: [
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  stylus('Shipping address', FontWeight.w700, 26),
                  GestureDetector(
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(Icons.add, color: hintTextColor),
                      ),
                      stylus('Add Address', FontWeight.w500, 16,
                          textcolor: hintTextColor)
                    ]),
                    onTap: ()=>onpressed(),
                  ),
                ],
              ),
              SizedBox(height: 24),
              buildListTile(address1, 1),
              SizedBox(height: 24),
              buildListTile(address2, 2),
            ],
          ),
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
                      'Proceed to Payment', primaryGreen, primaryGreen, white,
                      ontap: () { Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CheckoutPayment()));}),
                )),
          )
        ]));
  }

  ListTile buildListTile(String address, int value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          stylus('David Fayemi', FontWeight.bold, 18),
          SizedBox(height: 4),
          stylus(address, FontWeight.w500, 16, textcolor: hintTextColor)
        ],
      ),
      trailing: Radio(
        activeColor: orange,
        splashRadius: 30,
        value: value,
        groupValue: _value,
        onChanged: (int? value) {
          setState(() {
            _value = value;
          });
        },
      ),
      subtitle: Row(
        children: [
          SizedBox(height: 60),
          stylus('Change', FontWeight.w600, 16),
          SizedBox(width: 24),
          stylus('Delete', FontWeight.w600, 16, textcolor: red),
        ],
      ),
    );
  }

  onpressed() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return FractionallySizedBox(
              heightFactor: 0.6,
              child: Form(
                  child: ListView(padding: EdgeInsets.all(16), children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    stylus('New Address', FontWeight.w700, 26,
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
                  'Full Name',
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
                stylus('Phone Number', FontWeight.w700, 16),
                SizedBox(height: 16),
                textInput('+234', numberController, TextInputType.number),
                SizedBox(height: 16),
                stylus('Additional Phone Number', FontWeight.w700, 16),
                SizedBox(height: 16),
                textInput(
                  '+234',
                  additionalNumberController,
                  TextInputType.number,
                ),
                SizedBox(height: 16),
                stylus('Address', FontWeight.w700, 16),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: textInput(
                      'Input address', addressController, TextInputType.text),
                ),
                SizedBox(height: 16),
                stylus('State/Region', FontWeight.w700, 16),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: textInput('Input State/Region', stateController,
                      TextInputType.text),
                ),
                SizedBox(height: 16),
                stylus('City/Region', FontWeight.w700, 16),
                SizedBox(height: 16),
                textInput(
                    'Input city/region', cityController, TextInputType.text),
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
