import 'package:flutter/material.dart';
import '../model/style_refactor.dart';
import '../cart/cart_screen.dart';
import 'search.dart';
import '../home_screen.dart';
import 'product_detail.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = [
      buildCard(6, true),
      buildCard(7, false),
      buildCard(8, false),
      buildCard(9, false),
      buildCard(3, false),
      buildCard(3, false),
    ];
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    final tab = Container(
      padding: EdgeInsets.all(16),
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
              children: [
                Image.asset(
                  'assets/images/menu.png',
                  scale: 2,
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
                  child: stylus('RawFruits', FontWeight.w500, 16,
                      textcolor: hintTextColor),
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
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.width / 3.1),
            child: tab),
        bottomNavigationBar: Row(children: [
          buildNavBar(Icons.home_outlined, 0,
              padding: EdgeInsets.only(left: 80.0), ontap: () {
                _selectedIndex = 0;
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          }),
          GestureDetector(
              child: buildNavBar(Icons.search, 1),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Discover()));
              }),
          buildNavBar(Icons.more_horiz, 2,
              padding: EdgeInsets.only(right: 80.0)),
        ]),
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

  Widget buildCard(int num, bool isFavorite) {
    return GestureDetector(
      onTap: ()=>Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ProductDetail())) ,
      child: Container(
          margin: EdgeInsets.only(right: 16.0),
          decoration:
              BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4.0))),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      color: grey,
                      child:
                          Image.asset('assets/images/image$num.png', scale: 3.5)),
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
                          textcolor: darkGreen)
                    ],
                  )
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
                        isFavorite
                            ? Icon(Icons.favorite, color: red)
                            : Icon(Icons.favorite, color: white)
                      ],
                    )),
              ),
            ],
          )),
    );
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
