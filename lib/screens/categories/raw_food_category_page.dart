import 'dart:ui';

import 'package:aduaba_fresh/widgets/category_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class RawFoodCategoryPage extends StatefulWidget {
  const RawFoodCategoryPage({Key? key}) : super(key: key);

  @override
  _RawFoodCategoryPageState createState() => _RawFoodCategoryPageState();
}

class _RawFoodCategoryPageState extends State<RawFoodCategoryPage> {
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
                        'Raw Foods',
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
                  IntrinsicHeight(
                    child: Row(
                      children: <Widget>[
                        Text('18 items listed'),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => buildSortByModelSheet(),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.sort_by_alpha, size: 18),
                                ),
                                TextSpan(
                                    text: ' Sort ',
                                    style: TextStyle(
                                      color: Colors.black,
                                    )),
                                WidgetSpan(
                                  child:
                                      Icon(Icons.keyboard_arrow_down, size: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                        VerticalDivider(
                          width: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => buildFilterByModelSheet(),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child:
                                      Icon(Icons.filter_alt_outlined, size: 18),
                                ),
                                TextSpan(
                                    text: ' Filter',
                                    style: TextStyle(
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: CategoryTile(),
            ),
          ],
        ));
  }

  Widget buildSortByModelSheet() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Sort by',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              Text(
                'Popularity',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.check,
                  color: Colors.green,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Newest Arrival',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Prices: Lowest to Highest',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Prices: Highest to Lowest',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Divider(),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Spacer(),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 15.0),
              ),
              backgroundColor: MaterialStateProperty.all(
                Colors.green,
              ),
            ),
            onPressed: () {},
            child: Text(
              'Apply',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFilterByModelSheet() {
    bool checkedValue = false;
    return Container(
      padding: EdgeInsets.all(20.0),
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Filter',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Vendor',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: new BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  labelText: 'Search vendor',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Sub category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CheckboxListTile(
                title: Text("title text"),
                value: checkedValue,
                onChanged: (newValue) {},
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
              CheckboxListTile(
                title: Text("title text"),
                value: checkedValue,
                onChanged: (newValue) {},
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    bool checkedValue = false;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            color: Color.fromRGBO(0, 0, 0, 0.001),
            child: GestureDetector(
              onTap: () {},
              child: DraggableScrollableSheet(
                initialChildSize: 0.5,
                minChildSize: 0.5,
                maxChildSize: 0.65,
                builder: (_, controller) {
                  return Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: <Widget>[
                            Text(
                              'Filter',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Vendor',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                border: InputBorder.none,
                                labelText: 'Search vendor',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Sub category',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CheckboxListTile(
                          title: Text('Granular Fruits'),
                          value: checkedValue,
                          onChanged: (newValue) {
                            setState(() {});
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
