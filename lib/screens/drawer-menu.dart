import 'package:aduaba_fresh/cart/cart_screen.dart';
import 'package:aduaba_fresh/screens/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:aduaba_fresh/model/style_refactor.dart';
import 'account_page.dart';
import 'categories_page.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 80,
                    child: DrawerHeader(
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://i.pinimg.com/originals/39/e9/b3/39e9b39628e745a39f900dc14ee4d9a7.jpg'),
                            radius: 18.0,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          stylus(
                            'Andrea Charles',
                            FontWeight.bold,
                            18.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  buildListTile(Icons.shopping_cart, 'Cart', () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cart()));
                  }),
                  buildListTile(Icons.grid_view_rounded, 'Categories', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoriesPage()));
                  }),
                  buildListTile(Icons.favorite, 'My Wishlist', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WishlistPage()));
                  }),
                  buildListTile(Icons.shopping_cart, 'Orders', () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cart()));
                  }),
                  buildListTile(Icons.person, 'Account Details', () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AccountPage()));
                  }),
                ],
              ),
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 15.0,
                ),
                child: Text(
                  'Support',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  stylus('Contact Us', FontWeight.w400, 19),
                  SizedBox(
                    height: 40.0,
                  ),
                  stylus('Help & FAQs', FontWeight.w400, 19),
                ],
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/AduabaSmallLogo.png',
                ),
                SizedBox(
                  height: 35.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    stylus(
                      'Privacy Policy',
                      FontWeight.w400,
                      16,
                      textcolor: hintTextColor,
                    ),
                    Text(
                      '.',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    stylus(
                      'Terms of Use',
                      FontWeight.w400,
                      16,
                      textcolor: hintTextColor,
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.0,
                ),
              ],
            ),
          ],
        ),
      ),
      Positioned(
          top: 240,
          right: -18,
          child: IconButton(
            icon: Icon(
              Icons.cancel,
              size: 40.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ))
    ]);
  }

  ListTile buildListTile(IconData icon, String text, ontap) {
    return ListTile(
      leading: Icon(icon, color: greenGrey),
      title: stylus(text, FontWeight.w400, 18),
      onTap: () {
        ontap;
      },
    );
  }
}
