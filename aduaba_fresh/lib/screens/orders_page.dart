import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
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
                      'My Orders',
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
      body: getOrderslistCard(),
    );
  }

  Widget getOrderslistCard() {
    List items = ['1', '2', '3', '4', '5', '6'];
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Container(
          child: Column(
            children: [
              orderslistCard('Estimated Delivery Date on 21 Dec', Colors.amber),
              orderslistCard('Cancel', Colors.red),
              orderslistCard('Delivered on 31 Dec', Colors.green),
              orderslistCard('Estimated Delivery Date on 21 Dec', Colors.amber),
              orderslistCard('Cancel', Colors.red),
              orderslistCard('Delivered on 31 Dec', Colors.green),
            ],
          ),
        );
      },
    );
  }

  Widget orderslistCard(String orderInfo, Color colors) {
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
              scale: 0.01,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order #:341924186',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
        ),
      ),
    );
  }
}
