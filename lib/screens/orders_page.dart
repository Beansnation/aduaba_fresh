import 'package:aduaba_fresh/model/style_refactor.dart';
import 'package:flutter/material.dart';
import '../bottom_navbar.dart';
import 'order_summary.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    index = 2;
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
          preferredSize: const Size.fromHeight(75.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    stylus('My Orders', FontWeight.w700, 24,
                        textcolor: greenGrey),
                  ],
                ),
                SizedBox(height: 16.0),
                stylus('18 items listed', FontWeight.normal, 16,
                    textcolor: hintTextColor),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: getOrderslistCard(),
      ),
    );
  }

  Widget getOrderslistCard() {
    List items = ['1', '2', '3', '4', '5', '6'];
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OrderSummary()));
          },
          child: Container(
            padding: EdgeInsets.only(top: 36),
            child: Column(
              children: [
                orderslistCard('Estimated Delivery Date on 21 Dec', Colors.amber),
                SizedBox(height:16),
                Divider(),
                SizedBox(height:16),
                orderslistCard('Cancel', Colors.red),
                SizedBox(height:16),
                Divider(),
                SizedBox(height:16),
                orderslistCard('Delivered on 31 Dec', Colors.green),
                SizedBox(height:16),
                Divider(),
                SizedBox(height:16),
                orderslistCard('Estimated Delivery Date on 21 Dec', Colors.amber),
                SizedBox(height:16),
                Divider(),
                SizedBox(height:16),
                orderslistCard('Cancel', Colors.red),
                SizedBox(height:16),
                Divider(),
                SizedBox(height:16),
                orderslistCard('Delivered on 31 Dec', Colors.green),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget orderslistCard(String orderInfo, Color colors) {
    return Container(
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/Berry Powder.png',
                scale: 1.1,
              ),
              SizedBox(
                width: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order #:341924186',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'On 22 January, 2020 1:15pm',
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    orderInfo,
                    style: TextStyle(
                      color: colors,
                    ),
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}
