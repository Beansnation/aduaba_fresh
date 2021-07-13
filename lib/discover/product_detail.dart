import 'dart:convert';

import 'package:aduaba_fresh/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import '../model/style_refactor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aduaba_fresh/discover/discover.dart';
import 'package:http/http.dart' as http;

int? quant;

class ProductDetail extends StatefulWidget {
  var imgPath,
      productTitle,
      manufacturer,
      productDetails,
      productAmount,
      availability,
      productId;
  ProductDetail(
      this.imgPath,
      this.productTitle,
      this.manufacturer,
      this.productDetails,
      this.productAmount,
      this.availability,
      this.productId);
  @override
  _ProductDetailState createState() => _ProductDetailState(
      this.imgPath,
      this.productTitle,
      this.manufacturer,
      this.productDetails,
      this.productAmount,
      this.availability,
      this.productId);
}

class _ProductDetailState extends State<ProductDetail> {
  var quantity;
  var imgPath,
      productTitle,
      manufacturer,
      productDetails,
      productAmount,
      availability,
      productId;
  _ProductDetailState(
      this.imgPath,
      this.productTitle,
      this.manufacturer,
      this.productDetails,
      this.productAmount,
      this.availability,
      this.productId);

  List allProducts = [];
  bool isLoading = false;

  @override
  void initState() {
    index = 1;
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    setState(() {
      isLoading = true;
    });
    var response = await http.get(
      Uri.parse(
          "https://aduabawebapi.azurewebsites.net/api/Product/GetAllProducts"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Charset': 'utf-8'
      },
    );
    if (response.statusCode == 200) {
      var allProductItems = json.decode(response.body);
      setState(() {
        allProducts = allProductItems;
        isLoading = false;
      });
    } else {
      allProducts = [];
      isLoading = false;
    }
  }

  var manufactureName = ['manufactureName'];
  var productName = ['productName'];
  var productPrice = ['productAmount'];
  bool productAvailabilty = ['productAvailabilty'] as bool;
  var productImageUrlPath = ['productImageUrlPath'];
  var productDescription = ['productDescription'];
  var idProduct = ['productId'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              Image.network(imgPath.toString(), scale: .1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    ListTile(
                      minVerticalPadding: 24,
                      horizontalTitleGap: 100,
                      contentPadding: EdgeInsets.zero,
                      title:
                          stylus(productTitle.toString(), FontWeight.bold, 24),
                      subtitle: stylus(
                          manufacturer.toString(), FontWeight.normal, 16,
                          textcolor: greenGrey),
                      trailing: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.favorite, color: fuschiaPink),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    stylus(productDetails.toString(), FontWeight.normal, 16),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        stylus('MORE DETAILS', FontWeight.normal, 16),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(Icons.add)
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          stylus('N${productAmount.toString()}',
                              FontWeight.w700, 16),
                          actionButton(
                              'Add to cart', primaryGreen, primaryGreen, white,
                              ontap: () {
                            setState(() {
                              navigateToCartPage(
                                  productImageUrlPath,
                                  productName,
                                  manufactureName,
                                  productDescription,
                                  productAmount,
                                  productAvailabilty,
                                  productId);
                            });
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 48,
            left: 8.0,
            right: 0.0,
            child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        child: Icon(Icons.keyboard_backspace,
                            color: white, size: 35),
                        onTap: () => Navigator.pop(context))
                  ],
                )),
          ),
        ],
      ),
    );
  }

  void navigateToCartPage(var imgPath, productTitle, manufacturer,
      productDetails, productAmount, productAvailability, productId) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Cart(
                imgPath,
                productTitle,
                manufacturer,
                productDetails,
                productAmount,
                productAvailability,
                productId)));
  }
}

class AddToCart {
  final String productId;
  final int quantity;

  AddToCart({required this.productId, required this.quantity});

  factory AddToCart.fromJson(Map<String, dynamic> json) {
    return AddToCart(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }
}
