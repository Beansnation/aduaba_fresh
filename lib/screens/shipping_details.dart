import 'package:aduaba_fresh/cart/cart_screen.dart';
import 'package:aduaba_fresh/checkout/checkout_payment.dart';
import 'package:aduaba_fresh/model/style_refactor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShippingDetails extends StatefulWidget {
  const ShippingDetails({Key? key}) : super(key: key);

  @override
  _ShippingDetailsState createState() => _ShippingDetailsState();
}

class _ShippingDetailsState extends State<ShippingDetails> {
  int? _value = 1;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController additionalNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String address1 =
        'Railway Quarters, tejuosho, Surulere, Lagos\nSurulere (Ojuelegba), Lagos\n+2348074057767';
    String address2 =
        'Railway Road, tejuosho, Ikeja, Lagos,\nIkeja (Underbridge), Lagos\n+2348074057767';

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      stylus('Shipping Details', FontWeight.w700, 24,
                          textcolor: greenGrey),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
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
                    onTap: () => onpressed(),
                  ),
                ],
              ),
              SizedBox(height: 24),
              buildListTile(address1, 1),
              SizedBox(height: 24),
              buildListTile(address2, 2),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  stylus('Billing address', FontWeight.w700, 26),
                  GestureDetector(
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(Icons.add, color: hintTextColor),
                      ),
                      stylus('Add Address', FontWeight.w500, 16,
                          textcolor: hintTextColor)
                    ]),
                    onTap: () => onpressed(),
                  ),
                ],
              ),
              SizedBox(height: 24),
              buildListTile(address1, 1),
            ],
          ),
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
          stylus(address, FontWeight.w400, 16, textcolor: hintTextColor)
        ],
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(FontAwesomeIcons.trashAlt, size: 16, color: hintTextColor),
      ),
      subtitle: Row(
        children: [
          SizedBox(height: 60),
          GestureDetector(
            onTap: () {},
            child: stylus('Change', FontWeight.bold, 16),
          ),
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
