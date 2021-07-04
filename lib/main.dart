import 'package:aduaba_fresh/model/style_refactor.dart';
import 'package:flutter/material.dart';
import 'package:aduaba_fresh/screens/onboarding/splash_screen.dart';
import 'screens/categories/categories_grid.dart';
import 'package:aduaba_fresh/screens/onboarding/onboarding.dart';
import 'screens/home/home_screen.dart';
import 'package:aduaba_fresh/screens/account/account_page.dart';
import 'package:aduaba_fresh/screens/categories/categories_page.dart';
import 'package:aduaba_fresh/screens/home/drawer-menu.dart';
import 'package:aduaba_fresh/screens/account/edit_account.dart';
import 'package:aduaba_fresh/screens/account/empty_order.dart';
import 'package:aduaba_fresh/screens/account/empty_wishlist_page.dart';
import 'package:aduaba_fresh/screens/account/order_summary.dart';
import 'package:aduaba_fresh/screens/account/orders_page.dart';
import 'package:aduaba_fresh/screens/account/payment_page.dart';
import 'package:aduaba_fresh/screens/categories/raw_food_category_page.dart';
import 'package:aduaba_fresh/screens/account/wishlist_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryGreen,
        scaffoldBackgroundColor: white,
        appBarTheme: AppBarTheme(backgroundColor: white),
        shadowColor: white,
        fontFamily: 'TTNorms pro',
      ),
      home: Splash(),
    );
  }
}
