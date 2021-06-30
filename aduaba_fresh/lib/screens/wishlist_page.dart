import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
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
          preferredSize: const Size.fromHeight(90.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'My Wishlist',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreen.shade500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text('18 items listed'),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
      body: getWishlistCard(),
    );
  }

  Widget getWishlistCard() {
    List items = ['1', '2', '3', '4', '5', '6'];
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return wishlistCard();
      },
    );
  }

  Widget wishlistCard() {
    return Container(
      color: Colors.white,
      child: Card(
        child: ListTile(
          contentPadding: EdgeInsets.all(15),
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              //minWidth: 100,
              minHeight: 264,
              maxWidth: 104,
              maxHeight: 264,
            ),
            child: Image.asset(
              'assets/images/Berry Powder.png',
              fit: BoxFit.cover,
            ),
          ),
          // Container(
          //   width: 70,
          //   height: 200,
          //   decoration: BoxDecoration(
          //     //borderRadius: BorderRadius.circular(12),
          //     image: DecorationImage(
          //       fit: BoxFit.cover,
          //       image: AssetImage(
          //         'assets/images/Berry Powder.png',
          //       ),
          //     ),
          //   ),
          // ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Herbsconnect Organic Acai Berry powder Freeze Dried',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Emmanuel Produce',
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Text(
                    '₦35,000.00',
                    style: TextStyle(
                      color: Colors.amber,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'In stock',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing: Icon(
            Icons.delete_outline,
            size: 35.0,
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }
}
