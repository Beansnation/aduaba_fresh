import 'package:flutter/material.dart';
import 'style_refactor.dart';
import 'cart_screen.dart';
import 'screens/drawer-menu.dart';
import 'screens/categories_page.dart';
import 'discover.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    return Scaffold(
        //drawer: DrawerMenu(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              DrawerMenu();
            },
            child: Image.asset(
              'assets/images/menu.png',
              scale: 1.5,
            ),
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
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Cart()));
                    },
                  ),
                ))
          ],
        ),
        bottomNavigationBar: Row(children: [
          buildNavBar(
            Icons.home_outlined,
            0,
            padding: EdgeInsets.only(left: 80.0),
            ontap: () {
              setState(() {
                _selectedIndex = 0;
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              });
            },
          ),
          buildNavBar(
            Icons.search,
            1,
            ontap: () {
              setState(() {
                _selectedIndex = 1;
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Discover()));
              });
            },
          ),
          buildNavBar(Icons.more_horiz, 2,
              padding: EdgeInsets.only(right: 80.0)),
        ]),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              stylus('Hi, Andrea', FontWeight.w500, 18, textcolor: greenGrey),
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
                  Navigator.pushReplacement(
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

  Widget buildNavBar(IconData icon, int index,
      {EdgeInsetsGeometry? padding, ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: padding,
        height: 80,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: white,
              spreadRadius: 2,
              blurRadius: 20,
              offset: Offset(2, 0))
        ]),
        child: Icon(icon,
            size: 32,
            color: index == _selectedIndex ? primaryGreen : hintTextColor),
      ),
    );
  }
}
