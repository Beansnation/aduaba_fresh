import 'package:flutter/material.dart';

class EmptyOrder extends StatefulWidget {
  const EmptyOrder({Key? key}) : super(key: key);

  @override
  _EmptyOrderState createState() => _EmptyOrderState();
}

class _EmptyOrderState extends State<EmptyOrder> {
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
                Text('0 items listed'),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30),
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30.0),
              Image.asset(
                'assets/images/EmptyOrder.png',
                fit: BoxFit.cover,
              ),
              SizedBox(height: 40.0),
              Text(
                'No orders yet',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Hit the three button down below to create an order',
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              Container(
                width: double.infinity,
                height: 45.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Start Ordering',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
