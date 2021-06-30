import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
              children: [
                _buildCard(
                    'Emmanuel Produce',
                    'Herbsconnect Organic Acai Berry Powder Freeze Dried',
                    '₦35,000.00',
                    'In stock',
                    'assets/images/Raw Food1.png',
                    true,
                    context),
                _buildCard(
                    'Emmanuel Produce',
                    'Herbsconnect Organic Acai Berry Powder Freeze Dried',
                    '₦35,000.00',
                    'In stock',
                    'assets/images/Raw Food2.png',
                    true,
                    context),
                _buildCard(
                    'Emmanuel Produce',
                    'Herbsconnect Organic Acai Berry Powder Freeze Dried',
                    '₦35,000.00',
                    'In stock',
                    'assets/images/Raw Food3.png',
                    true,
                    context),
                _buildCard(
                    'Emmanuel Produce',
                    'Herbsconnect Organic Acai Berry Powder Freeze Dried',
                    '₦35,000.00',
                    'In stock',
                    'assets/images/Raw Food4.png',
                    true,
                    context),
                _buildCard(
                    'Emmanuel Produce',
                    'Herbsconnect Organic Acai Berry Powder Freeze Dried',
                    '₦35,000.00',
                    'In stock',
                    'assets/images/Raw Food4.png',
                    true,
                    context),
                _buildCard(
                    'Emmanuel Produce',
                    'Herbsconnect Organic Acai Berry Powder Freeze Dried',
                    '₦35,000.00',
                    'In stock',
                    'assets/images/Raw Food4.png',
                    true,
                    context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String merchant, String productName, String price,
      String availability, String imgPath, bool isFavorite, context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isFavorite
                        ? Icon(
                            Icons.favorite,
                            color: Colors.black,
                          )
                        : Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
