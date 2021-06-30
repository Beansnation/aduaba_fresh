import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_backspace,
              color: Colors.black,
              size: 35.0,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
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
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
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
            Icons.arrow_forward_sharp,
            size: 35.0,
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }
}
