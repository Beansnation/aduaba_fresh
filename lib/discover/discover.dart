import 'dart:convert';

import 'package:aduaba_fresh/categories_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bottom_navbar.dart';
import '../model/style_refactor.dart';
import '../cart/cart_screen.dart';
import 'search.dart';
import 'product_detail.dart';
import 'package:aduaba_fresh/screens/drawer-menu.dart';
import 'package:http/http.dart' as http;

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
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

  var scaffoldKey = GlobalKey<ScaffoldState>();
  Color favColor = white;
  Color favColor1 = white;
  Color favColor2 = white;
  Color favColor3 = white;
  Color favColor4 = white;
  Color favColor5 = white;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = 324;
    final double itemWidth = size.width / 1.8;
    // final tab = Container(
    //   padding: EdgeInsets.only(left: 5, right: 16, top: 16, bottom: 16),
    //   width: MediaQuery.of(context).size.width,
    //   height: MediaQuery.of(context).size.height / 2,
    //   decoration: BoxDecoration(color: white, boxShadow: [
    //     BoxShadow(
    //         color: black.withOpacity(0.1),
    //         spreadRadius: 2,
    //         blurRadius: 20,
    //         offset: Offset(0, 2))
    //   ]),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       SizedBox(
    //         height: 30,
    //       ),
    //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             IconButton(
    //               icon: ImageIcon(
    //                 AssetImage(
    //                   'assets/images/menu.png',
    //                 ),
    //                 size: 30,
    //                 color: black,
    //               ),
    //               onPressed: () {
    //                 scaffoldKey.currentState!.openDrawer();
    //               },
    //             ),
    //             SizedBox(width: 32),
    //             stylus('Discover', FontWeight.w700, 24, textcolor: greenGrey),
    //           ],
    //         ),
    //         Row(
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.all(16.0),
    //               child: InkWell(
    //                 onTap: () {
    //                   Navigator.push(context,
    //                       MaterialPageRoute(builder: (context) => Search()));
    //                 },
    //                 child: Icon(
    //                   Icons.search,
    //                   color: hintTextColor,
    //                   size: 30,
    //                 ),
    //               ),
    //             ),
    //             CircleAvatar(
    //               backgroundColor: primaryGreen,
    //               child: IconButton(
    //                   icon: ImageIcon(AssetImage('assets/images/cart.png'),
    //                       size: 20),
    //                   color: white,
    //                   onPressed: () {
    //                     Navigator.push(context,
    //                         MaterialPageRoute(builder: (context) => Cart()));
    //                   }),
    //             )
    //           ],
    //         ),
    //       ]),
    //       SizedBox(
    //         height: 15,
    //       ),
    //       SingleChildScrollView(
    //         scrollDirection: Axis.horizontal,
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 8),
    //               child: stylus('All', FontWeight.w800, 16),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 8),
    //               child: GestureDetector(
    //                 child: stylus('RawFruits', FontWeight.w500, 16,
    //                     textcolor: hintTextColor),
    //                 onTap: () {
    //                   Navigator.push(
    //                       context,
    //                       MaterialPageRoute(
    //                           builder: (context) => CategoriesGrid()));
    //                 },
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 8),
    //               child: stylus('Spices', FontWeight.w500, 16,
    //                   textcolor: hintTextColor),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 8),
    //               child: stylus('Cosmetics', FontWeight.w500, 16,
    //                   textcolor: hintTextColor),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 8),
    //               child: stylus('Fruits & Vegetables', FontWeight.w500, 16,
    //                   textcolor: hintTextColor),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(child: DrawerMenu()),
      appBar: AppBar(
          elevation: 5.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: ImageIcon(
              AssetImage(
                'assets/images/menu.png',
              ),
              size: 30,
              color: black,
            ),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: stylus('Discover', FontWeight.w700, 24, textcolor: greenGrey),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Search()));
                      },
                      child: Icon(
                        Icons.search,
                        color: hintTextColor,
                        size: 30,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: primaryGreen,
                    child: IconButton(
                        icon: ImageIcon(AssetImage('assets/images/cart.png'),
                            size: 20),
                        color: white,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cart()));
                        }),
                  )
                ],
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: stylus('All', FontWeight.w800, 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        child: stylus('Raw Fruits', FontWeight.w500, 16,
                            textcolor: hintTextColor),
                        onTap: () {
                          navigateToGridPage('Raw Fruits');
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        child: stylus('Spices', FontWeight.w500, 16,
                            textcolor: hintTextColor),
                        onTap: () {
                          navigateToGridPage('Spices');
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        child: stylus('Cosmetics', FontWeight.w500, 16,
                            textcolor: hintTextColor),
                        onTap: () {
                          navigateToGridPage('Cosmetics');
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        child: stylus('Fruits & Vegetable', FontWeight.w500, 16,
                            textcolor: hintTextColor),
                        onTap: () {
                          navigateToGridPage('Fruits & Vegetable');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
      bottomNavigationBar: BottomNav(),
      body: (allProducts.contains(null) || allProducts.length < 0 || isLoading)
          ? Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.only(left: 16.0, top: 16, bottom: 16),
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  controller: new ScrollController(keepScrollOffset: false),
                  childAspectRatio: (itemWidth / itemHeight),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: allProducts.map((value) {
                    return new Container(
                      margin: new EdgeInsets.all(2.0),
                      child: buildCard(value),
                    );
                  }).toList(),
                ),
              ],
            ),
    );
  }

  Widget buildCard(item) {
    var manufactureName = item['manufactureName'];
    var productName = item['productName'];
    var productAmount = item['productAmount'];
    bool productAvailabilty = item['productAvailabilty'] as bool;
    var productImageUrlPath = item['productImageUrlPath'];
    var productDescription = item['productDescription'];

    return GestureDetector(
      onTap: () => navigateToProductDetailPage(productImageUrlPath, productName,
          manufactureName, productDescription, productAmount),
      child: Container(
          margin: EdgeInsets.only(right: 13.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 160.0,
                    width: 160.0,
                    decoration: BoxDecoration(
                      color: grey,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                        image: NetworkImage(productImageUrlPath.toString(),
                            scale: 1),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 0.0,
                    right: 8.0,
                    child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                                child: Icon(Icons.favorite, color: favColor))
                          ],
                        )),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              stylus(manufactureName.toString(), FontWeight.w500, 12,
                  textcolor: greenGrey),
              SizedBox(height: 4),
              stylus(
                productName.toString(),
                FontWeight.w700,
                15,
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  stylus('N${productAmount.toString()}', FontWeight.w700, 14,
                      textcolor: orange),
                  SizedBox(width: 13.7),
                  stylus(productAvailabilty ? 'In stock' : 'Not Available',
                      FontWeight.w600, 16,
                      textcolor: darkGreen),
                  SizedBox(height: 18),
                ],
              ),
            ],
          )),
    );
  }

  // Widget getAllProductsListCard() {
  //
  // }

  void navigateToGridPage(String gridTitle) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CategoriesGrid(gridTitle)));
  }

  void navigateToProductDetailPage(String imgPath, productTitle, manufacturer,
      productDetails, productAmount) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetail(imgPath, productTitle,
                manufacturer, productDetails, productAmount)));
  }
}
