import 'package:aduaba_fresh/screens/account_page.dart';
import 'package:aduaba_fresh/screens/categories_page.dart';
import 'package:aduaba_fresh/screens/drawer-menu.dart';
import 'package:aduaba_fresh/screens/edit_account.dart';
import 'package:aduaba_fresh/screens/empty_order.dart';
import 'package:aduaba_fresh/screens/empty_wishlist_page.dart';
import 'package:aduaba_fresh/screens/onboarding_page.dart';
import 'package:aduaba_fresh/screens/order_summary.dart';
import 'package:aduaba_fresh/screens/orders_page.dart';
import 'package:aduaba_fresh/screens/payment_page.dart';
import 'package:aduaba_fresh/screens/raw_food_category_page.dart';
import 'package:aduaba_fresh/screens/splash_screen.dart';
import 'package:aduaba_fresh/screens/wishlist_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OrderPage(),
    );
  }
}
