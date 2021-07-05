import 'package:aduaba_fresh/categories_grid.dart';
import 'package:flutter/material.dart';
import '../bottom_navbar.dart';
import '../model/style_refactor.dart';
import '../cart/cart_screen.dart';
import 'search.dart';
import 'product_detail.dart';
import 'package:aduaba_fresh/screens/drawer-menu.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {

  @override
  void initState() {
    index = 1;
    super.initState();
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
    List<Widget> cards = [
      buildCard(6, favColor, () {
        setState(() {
          if (favColor == white) {
            favColor = red;
          } else{
            favColor = white;
          } 
        });
      }),
      buildCard(7, favColor3, () {
        setState(() {
          if (favColor3 == white) {
            favColor3 = red;
          } else{
            favColor3 = white;
          } 
        });
      }),
      buildCard(8, favColor1, () {
        setState(() {
          if (favColor1 == white) {
            favColor1 = red;
          } else{
            favColor1 = white;
          } 
        });
      }),
      buildCard(9, favColor2, () {
        setState(() {
          if (favColor2 == white) {
            favColor2 = red;
          } else{
            favColor2 = white;
          } 
        });
      }),
      buildCard(3, favColor4, () {
        setState(() {
         if (favColor4 == white) {
            favColor4 = red;
          } else{
            favColor4 = white;
          } 
        });
      }),
      buildCard(3, favColor5, () {
        setState(() {
           if (favColor5 == white) {
            favColor5 = red;
          } else{
            favColor5 = white;
          } 
        });
      }),
    ];
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = 349;
    final double itemWidth = size.width / 2;
    final tab = Container(
      padding: EdgeInsets.only(left: 5, right: 16, top: 16, bottom: 16),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(color: white, boxShadow: [
        BoxShadow(
            color: black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 20,
            offset: Offset(0, 2))
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
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
                SizedBox(width: 32),
                stylus('Discover', FontWeight.w700, 24, textcolor: greenGrey),
              ],
            ),
            Row(
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
          ]),
          SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: stylus('All', FontWeight.w800, 16),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    child: stylus('RawFruits', FontWeight.w500, 16,
                        textcolor: hintTextColor),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoriesGrid()));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: stylus('Spices', FontWeight.w500, 16,
                      textcolor: hintTextColor),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: stylus('Cosmetics', FontWeight.w500, 16,
                      textcolor: hintTextColor),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: stylus('Fruits & Vegetables', FontWeight.w500, 16,
                      textcolor: hintTextColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    return Scaffold(
        key: scaffoldKey,
        drawer: Drawer(child: DrawerMenu()),
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.width / 2.9),
            child: tab),
        bottomNavigationBar: BottomNav(),
        body: ListView(
          padding: const EdgeInsets.only(left: 16.0, top: 16, bottom: 16),
          children: [
            GridView.count(
              crossAxisCount: 2,
              controller: new ScrollController(keepScrollOffset: false),
              childAspectRatio: (itemWidth / itemHeight),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: cards.map((value) {
                return new Container(
                  margin: new EdgeInsets.all(2.0),
                  child: value,
                );
              }).toList(),
            ),
          ],
        ));
  }

  Widget buildCard(int num, Color favColor, Function()? ontap) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProductDetail())),
      child: Container(
          margin: EdgeInsets.only(right: 13.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      color: grey,
                      child: Image.asset('assets/images/image$num.png',
                          scale: 3.5)),
                  SizedBox(height: 8.0),
                  stylus('Emmanuel Produce', FontWeight.w500, 12,
                      textcolor: greenGrey),
                  SizedBox(height: 4),
                  stylus(
                    'Herbsconnect Organic\nAcai Berry Powder Freeze\nDried',
                    FontWeight.w700,
                    15,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      stylus('N35,000.00', FontWeight.w700, 14,
                          textcolor: orange),
                      SizedBox(width: 13.7),
                      stylus('In stock', FontWeight.w600, 16,
                          textcolor: darkGreen),
                      SizedBox(height: 18),
                    ],
                  ),
                ],
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
                            onTap: ontap,
                            child: Icon(Icons.favorite, color: favColor))
                      ],
                    )),
              ),
            ],
          )),
    );
  }
}
