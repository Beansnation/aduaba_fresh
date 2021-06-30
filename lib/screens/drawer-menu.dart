import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key, child}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Aduaba Fresh',
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  children: <Widget>[
                    DrawerHeader(
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/OnBoarding3.png'),
                            radius: 25.0,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            'Andrea Charles',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          // Divider(
                          //   thickness: 20,
                          //   height: 20,
                          //   color: Colors.red,
                          // ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.shopping_cart),
                      title: Text('Cart'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.grid_view_rounded),
                      title: Text('Categories'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.favorite),
                      title: Text('My Wishlist'),
                      trailing: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.cancel,
                            size: 55.0,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.shopping_cart),
                      title: Text('Orders'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Account Details'),
                      onTap: () {},
                    ),
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
                    vertical: 18.0,
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
                    Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'Help & FAQs',
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80.0,
              ),
              Column(
                children: [
                  Image(
                    image: AssetImage('assets/images/AduabaSmallLogo.png'),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Text(
                        '.',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Text(
                        'Terms of Use',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey.shade500,
                        ),
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
      ),
    );
  }
}
