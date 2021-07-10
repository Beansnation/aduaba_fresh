import 'package:flutter/material.dart';
import 'bottom_navbar.dart';
import 'model/style_refactor.dart';
import 'cart/cart_screen.dart';
import 'screens/drawer-menu.dart';
import 'screens/categories_page.dart';
import 'discover/discover.dart';
import 'package:aduaba_fresh/registration/sign_up.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    index = 0;
    super.initState();
  }

  TextEditingController searchController = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: Drawer(child: DrawerMenu()),
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
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
          title: Center(
              child: stylus('Aduaba Fresh', FontWeight.w700, 20,
                  textcolor: black)),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  backgroundColor: primaryGreen,
                  child: IconButton(
                    icon: ImageIcon(AssetImage('assets/images/cart.png'),
                        size: 30),
                    color: white,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cart()));
                    },
                  ),
                ))
          ],
        ),
        bottomNavigationBar: BottomNav(),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              stylus('Hi, $userFirstName', FontWeight.w500, 18,
                  textcolor: greenGrey),
              SizedBox(height: 8),
              stylus('What are you looking for today?', FontWeight.w700, 26,
                  textcolor: greenGrey),
              SizedBox(
                height: 16,
              ),
              textInput(
                'Search Product',
                searchController,
                TextInputType.text,
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: hintTextColor,
                ),
              ),
              SizedBox(height: 24.0),
              GestureDetector(
                child: buildRow("Categories"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoriesPage()));
                },
              ),
              SizedBox(height: 16.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildScrollText(primaryGreen, 'Raw Food', 120),
                    SizedBox(width: 16.0),
                    buildScrollText(fuschiaPink, 'Spices', 120),
                    SizedBox(width: 16.0),
                    buildScrollText(darkGreen, 'Bakery', 120),
                    SizedBox(width: 16.0),
                    buildScrollText(orange, 'Cosmetics', 120),
                    SizedBox(width: 16.0),
                    buildScrollText(peachOrange, 'Fruits', 120),
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              buildRow("Today's Promo"),
              SizedBox(height: 16.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildPromoCard(secondaryGreen),
                    buildPromoCard(neonGreen)
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              buildRow("Best Selling"),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    bestSellingCard(1),
                    bestSellingCard(2),
                    bestSellingCard(3),
                  ],
                ),
              ),
              SizedBox(height: 24),
              buildRow("Featured products"),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    bestSellingCard(4),
                    bestSellingCard(5),
                    bestSellingCard(3),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
