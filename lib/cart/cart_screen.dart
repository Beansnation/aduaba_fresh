import 'dart:convert';

import 'package:aduaba_fresh/discover/discover.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/style_refactor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aduaba_fresh/checkout/checkout_summary.dart';
import 'package:http/http.dart' as http;
import 'package:aduaba_fresh/cart/empty_cart.dart';
import 'package:aduaba_fresh/discover/product_detail.dart';

class Cart extends StatefulWidget {
  String? imgPath;
  String? productTitle;
  String? manufacturer;
  var productAmount;
  bool? availability;
  int quantity;
  String productId;

  Cart(this.imgPath, this.productTitle, this.manufacturer, this.productAmount,
      this.availability, this.quantity, this.productId);
  @override
  _CartState createState() => _CartState(
        this.imgPath,
        this.productTitle,
        this.manufacturer,
        this.productAmount,
        this.availability,
        this.quantity,
        this.productId,
      );
}

class _CartState extends State<Cart> {
  List cartProducts = [];
  bool isLoading = false;

  String? imgPath;
  String? productTitle;
  String? manufacturer;
  var productAmount;
  bool? availability;
  int quantity;
  String productId;
  _CartState(
    this.imgPath,
    this.productTitle,
    this.manufacturer,
    this.productAmount,
    this.availability,
    this.quantity,
    this.productId,
  );
  bool _checkBoxVal = true;
  bool _checkBoxVal1 = false;
  bool _checkBoxVal2 = true;
  bool _checkBoxVal3 = false;

  @override
  void initState() {
    super.initState();
    // fetchCartProducts();
  }

  // fetchCartProducts() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   var response = await http.get(
  //     Uri.parse("https://aduabawebapi.azurewebsites.net/api/Cart/GetCartItem"),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Charset': 'utf-8'
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     var allCartItems = json.decode(response.body);
  //     setState(() {
  //       cartProducts = allCartItems;
  //       isLoading = false;
  //     });
  //   } else {
  //     cartProducts = [];
  //     isLoading = false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final tab = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        stylus('${cartProducts.length} items listed', FontWeight.w500, 15,
            textcolor: hintTextColor),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Icon(
                Icons.check,
                color: hintTextColor,
              ),
              stylus('Select All', FontWeight.w500, 15,
                  textcolor: hintTextColor),
            ],
          ),
        ),
        Row(
          children: [
            Icon(FontAwesomeIcons.trashAlt, size: 16, color: hintTextColor),
            stylus('Delete Selected', FontWeight.w500, 15,
                textcolor: hintTextColor),
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
          preferredSize: const Size.fromHeight(80.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    stylus('Cart', FontWeight.w700, 24, textcolor: greenGrey),
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
      body: cartProducts.isEmpty
          ? SafeArea(
              child: Stack(
                children: [
                  Container(
                    margin:
                        EdgeInsets.all(MediaQuery.of(context).size.width / 6),
                    width: 300,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/emptycart.png',
                          scale: 4,
                          color: greenGrey.withOpacity(0.5),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: stylus(
                              'Your cart is empty', FontWeight.w700, 24,
                              alignment: TextAlign.center),
                        ),
                        stylus(
                            'Hit the green button down below to create an order',
                            FontWeight.w500,
                            16,
                            alignment: TextAlign.center),
                      ],
                    ),
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.width * 6 / 7,
                      left: 0.0,
                      right: 0.0,
                      child: BottomFloatEmptyCart()),
                ],
              ),
            )
          : SafeArea(
              child: Stack(
                children: [
                  Container(
                      padding: EdgeInsets.all(16.0),
                      child: ListView.builder(
                          itemCount: cartProducts.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                cartCard((bool? value) {
                                  setState(() {
                                    this._checkBoxVal = value!;
                                  });
                                }, this._checkBoxVal, cartProducts[index]),
                                SizedBox(height: 16),
                              ],
                            );
                          })),
                  Positioned(
                      // top: MediaQuery.of(context).size.height * 5.5 / 11,
                      left: 0.0,
                      right: 0.0,
                      bottom: 6,
                      child: BottomFloat()),
                ],
              ),
            ),
    );
  }

  Container cartCard(onchanged, bool checkBoxVal, item) {
    //var manufactureName = item[manufactureName];
    var productName = item['productName'];
    var productAmount = item['productAmount'];
    bool productAvailabilty = item['productAvailabilty'] as bool;
    var productImageUrlPath = item['productImageUrlPath'];
    var productDescription = item['productDescription'];
    var productQuantityPurchased = item['productQuantityPurchased'];

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              height: 26,
              width: 20,
              child: Checkbox(
                  value: checkBoxVal,
                  activeColor: orange,
                  checkColor: hintTextColor,
                  onChanged: onchanged)),
          Container(
              margin: EdgeInsets.only(right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SizedBox(height:12),
                  stylus(
                    productName.toString(),
                    FontWeight.w700,
                    18,
                  ),
                  SizedBox(height: 4),
                  stylus(manufacturer!, FontWeight.w500, 12,
                      textcolor: greenGrey),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      stylus(productAmount.toString(), FontWeight.w700, 16,
                          textcolor: orange),
                      SizedBox(width: 16),
                      stylus(availability! ? 'In stock' : 'Not Available',
                          FontWeight.w600, 16,
                          textcolor: darkGreen)
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Container(
                          height: 34,
                          width: 36,
                          decoration: BoxDecoration(
                              color: grey,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(2))),
                          child: Icon(Icons.remove,
                              color: hintTextColor, size: 20)),
                      Container(
                          height: 34,
                          width: 36,
                          decoration: BoxDecoration(
                            color: grey,
                          ),
                          child: Center(
                              child: stylus('1', FontWeight.w500, 18,
                                  textcolor: hintTextColor))),
                      Container(
                          height: 34,
                          width: 36,
                          decoration: BoxDecoration(
                              color: grey,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(2),
                                  bottomRight: Radius.circular(2))),
                          child:
                              Icon(Icons.add, color: hintTextColor, size: 20)),
                      SizedBox(width: 16),
                      Container(
                          height: 34,
                          width: 36,
                          decoration: BoxDecoration(
                              color: grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2))),
                          child: Icon(FontAwesomeIcons.trashAlt,
                              color: hintTextColor, size: 16))
                    ],
                  )
                ],
              )),
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                image: NetworkImage(imgPath!, scale: 1),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Container(
          //   height: ,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.all(Radius.circular(2))),
          //     child: Image.network(imgPath!, scale: 20))
        ],
      ),
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
                  stylus('Total 2 Items', FontWeight.w500, 16,
                      textcolor: hintTextColor),
                  stylus('N35,000', FontWeight.w800, 16),
                ],
              ),
              SizedBox(height: 16),
              actionButton(
                  'Proceed to Checkout', primaryGreen, primaryGreen, white,
                  ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Checkout()));
              }),
              SizedBox(height: 16),
              actionButton('Continue Shopping', white, black, black, ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Discover()));
              }),
              SizedBox(height: 16),
            ],
          ),
        ));
  }
}
