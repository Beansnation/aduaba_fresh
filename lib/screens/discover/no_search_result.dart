import 'package:aduaba_fresh/model/style_refactor.dart';
import 'package:flutter/material.dart';

class NullSearch extends StatefulWidget {
  @override
  _NullSearchState createState() => _NullSearchState();
}

class _NullSearchState extends State<NullSearch> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final tab = Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: white, boxShadow: [
        BoxShadow(
            color: black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 20,
            offset: Offset(0, 2))
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Icon(Icons.arrow_back, color: black),
          SizedBox(height: 16),
          stylus('Search', FontWeight.w700, 24, textcolor: greenGrey),
          SizedBox(height: 16),
          textInput(
            'Search Product',
            searchController,
            TextInputType.text,
            icon: Icon(
              Icons.search,
              size: 30,
              color: hintTextColor,
            ),
          ),
        ],
      ),
    );
    return Scaffold(
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.width / 2.2),
            child: tab),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            stylus('No Search Result', FontWeight.w700, 18),
            stylus(
                "We currently don't have what you’re looking for.  Why not try out similar products",
                FontWeight.w500,
                14),
            SizedBox(height: 32),
            stylus('Related Searches', FontWeight.w700, 18),
            SizedBox(height: 24),
            buildPopularSearch(1),
            SizedBox(height: 24),
            buildPopularSearch(2),
            SizedBox(height: 24),
            buildPopularSearch(3),
          ],
        ));
  }

  Row buildPopularSearch(int num) {
    return Row(
      children: [
        Image.asset('assets/images/search$num.png', scale: 3.5),
        SizedBox(width: 16),
        Container(
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                stylus('Herbsconnect Organic Acai Berry Powder Freeze Dried',
                    FontWeight.w600, 16),
                SizedBox(height: 12),
                stylus('Emmanuel Produce', FontWeight.w500, 14,
                    textcolor: hintTextColor),
                SizedBox(height: 12),
                Row(
                  children: [
                    stylus('N35,000.00', FontWeight.w700, 14,
                        textcolor: orange),
                    SizedBox(width: 13.7),
                    stylus('In stock', FontWeight.w600, 16,
                        textcolor: darkGreen)
                  ],
                )
              ],
            ))
      ],
    );
  }
}
