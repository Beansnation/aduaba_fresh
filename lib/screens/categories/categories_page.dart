import 'package:aduaba_fresh/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:aduaba_fresh/model/style_refactor.dart';
import '../../widgets/bottom_navbar.dart';
import 'categories_grid.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  void initState() {
    index = 0;
    super.initState();
  }

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
          preferredSize: const Size.fromHeight(80.0),
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
                    stylus('Categories', FontWeight.w700, 24,
                        textcolor: greenGrey),
                    CircleAvatar(
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
                    )
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text('23 Categories'),
                SizedBox(
                  height: 12.0,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
      body: getCategoriesListCard(),
    );
  }

  Widget getCategoriesListCard() {
    List items = ['1', '2', '3', '4', '5', '6'];
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return categoriesListCard();
      },
    );
  }

  Widget categoriesListCard() {
    return Container(
      color: Colors.white,
      child: Card(
        child: ListTile(
          contentPadding: EdgeInsets.all(15),
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/RawFruits.png',
                ),
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Raw Fruits',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
          subtitle: Text(
            '243 Items',
            style: TextStyle(
              color: Colors.grey[400],
            ),
          ),
          trailing: Icon(
            Icons.arrow_right_alt,
            size: 35.0,
            color: Colors.grey[400],
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CategoriesGrid()));
          },
        ),
      ),
    );
  }
}
