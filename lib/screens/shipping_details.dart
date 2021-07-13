import 'dart:convert';

import 'package:aduaba_fresh/cart/cart_screen.dart';
import 'package:aduaba_fresh/checkout/checkout_payment.dart';
import 'package:aduaba_fresh/model/style_refactor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:aduaba_fresh/registration/sign_up.dart';

class ShippingDetails extends StatefulWidget {
  const ShippingDetails({Key? key}) : super(key: key);

  @override
  _ShippingDetailsState createState() => _ShippingDetailsState();
}

class _ShippingDetailsState extends State<ShippingDetails> {
  List shippingList = [];
  final _key = GlobalKey<FormState>();
  Future<Address>? _futureRegister;
  int? _value = 1;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController additionalNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  String? phoneNumber;
  String? additionalPhoneNumber;
  String? address;
  String? state;
  String? city;

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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
              Container(
                child: Expanded(
                  child: ListView.builder(
                      itemCount: shippingList.length,
                      itemBuilder: (context, index) {
                        return buildListTile(shippingList[index]);
                      }),
                ),
              ),
            ],
          ),
        ));
  }

  ListTile buildListTile(item) {
    var userphoneNumber = item['phoneNumber'];
    var userAdditionalPhoneNumber = item['additionalPhoneNumber'];
    var userAddress = item['userAddress'];
    var userState = item['state'];
    var userCity = item['country'];
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          stylus('$userFirstName $userLastName', FontWeight.bold, 18),
          SizedBox(height: 4),
          stylus(address.toString(), FontWeight.w400, 16,
              textcolor: hintTextColor),
          SizedBox(height: 4),
          stylus(state.toString(), FontWeight.w400, 16,
              textcolor: hintTextColor),
          SizedBox(height: 4),
          stylus(city.toString(), FontWeight.w400, 16,
              textcolor: hintTextColor),
          SizedBox(height: 4),
          stylus(
              '${phoneNumber.toString()}, ${additionalPhoneNumber.toString()}',
              FontWeight.w400,
              16,
              textcolor: hintTextColor),
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
                  '$userFirstName $userLastName',
                  nameController,
                  TextInputType.text,
                  enabled: false,
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
                    setState(() {
                      phoneNumber = numberController.text;
                      additionalPhoneNumber = additionalNumberController.text;
                      address = addressController.text;
                      state = stateController.text;
                      city = cityController.text;
                      _futureRegister = addAddress(
                          numberController.text,
                          additionalNumberController.text,
                          addressController.text,
                          stateController.text,
                          cityController.text);
                    });
                  },
                ),
              ])));
        });
  }

  Future<Address> addAddress(
      String phoneNumber, additionalPhoneNumber, address, state, city) async {
    final response = await http.post(
      Uri.parse(
          "https://aduabawebapi.azurewebsites.net/api/Address/PostUserAddress"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Charset': 'utf-8'
      },
      body: jsonEncode(<String, String>{
        "userAddress": addressController.text,
        "state": stateController.text,
        "country": cityController.text,
        "phoneNumber": numberController.text,
        "additionalPhoneNumber": additionalNumberController.text,
      }),
    );

    if (response.statusCode != 200) {
      var shippingItems = json.decode(response.body);
      setState(() {
        shippingList = shippingItems;
      });
      // If the server did return a 200 CREATED response,
      // then parse the JSON.

      Navigator.pop(context);
      return Address.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 CREATED response,
      // then throw an exception.
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => SignUp()));
      throw ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create user. Try again.')));
    }
  }
}

class Address {
  final String phoneNumber;
  final String additionalPhoneNumber;
  final String address;
  final String state;
  final String city;

  Address({
    required this.phoneNumber,
    required this.additionalPhoneNumber,
    required this.address,
    required this.state,
    required this.city,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      phoneNumber: json['phoneNumber'],
      additionalPhoneNumber: json['additionalPhoneNumber'],
      address: json['address'],
      state: json['state'],
      city: json['city'],
    );
  }
}
