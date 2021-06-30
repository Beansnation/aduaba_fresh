import 'package:aduaba_fresh/style_refactor.dart';
import 'package:flutter/material.dart';
import 'package:aduaba_fresh/splash_screen.dart';
import 'categories_grid.dart';
import 'checkout/checkout_summary.dart';
import 'cart_screen.dart';
import 'empty_cart.dart';
import 'package:aduaba_fresh/registration/sign_in.dart';
import 'home_screen.dart';
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


void main()=> runApp(MyApp());


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
      home: Checkout(),
    );
  }
}

