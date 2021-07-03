import 'package:flutter/material.dart';
import 'model/style_refactor.dart';
import 'cart/cart_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoriesGrid extends StatefulWidget {
  @override
  _CategoriesGridState createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid> {
  TextEditingController searchController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  bool checkboxVal = false;
  RangeValues values = RangeValues(0, 2000000);
  double start = 0.00;
  double end = 2000000.00;
  @override
  Widget build(BuildContext context) {
    List<Widget> cards = [
      buildCard(6, true),
      buildCard(7, false),
      buildCard(8, false),
      buildCard(9, false),
      buildCard(3, false),
      buildCard(3, false),
    ];
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.2;
    final double itemWidth = size.width / 2;
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
            height: 36,
          ),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.keyboard_backspace, size: 35, color: black)),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              stylus('Raw Food', FontWeight.w700, 24, textcolor: greenGrey),
              CircleAvatar(
                backgroundColor: primaryGreen,
                child: IconButton(
                    icon: ImageIcon(AssetImage('assets/images/cart.png'),
                        size: 24),
                    color: white,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cart()));
                    }),
              )
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              stylus('18 items listed', FontWeight.normal, 16,
                  textcolor: hintTextColor),
              Row(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImageIcon(AssetImage('assets/images/sort.png'),
                            size: 16),
                        SizedBox(width: 4),
                        stylus('Sort', FontWeight.w400, 16,
                            textcolor: blackGrey),
                        SizedBox(width: 4),
                        Icon(FontAwesomeIcons.chevronDown,
                            size: 14, color: hintTextColor),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  ImageIcon(AssetImage('assets/images/vertical bar.png'),
                      color: hintTextColor),
                  SizedBox(width: 20),
                  GestureDetector(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.filter_alt_outlined, size: 20),
                          SizedBox(width: 4),
                          stylus('Filter', FontWeight.w400, 16,
                              textcolor: blackGrey),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        bottomSheet(context);
                      });
                    },
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
    return Scaffold(
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.width / 2.8),
            child: tab),
        body: ListView(
          padding: const EdgeInsets.only(left: 16.0, top: 16, bottom: 16),
          children: [
            new GridView.count(
              crossAxisCount: 2,
              controller: new ScrollController(keepScrollOffset: false),
              childAspectRatio: (itemWidth / itemHeight),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: cards.map((value) {
                return new Container(
                  margin: new EdgeInsets.all(1.0),
                  child: value,
                );
              }).toList(),
            ),
          ],
        ));
  }

  Container buildCard(int num, bool isFavorite) {
    return Container(
        margin: EdgeInsets.only(right: 16.0),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4.0))),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    color: grey,
                    child:
                        Image.asset('assets/images/image$num.png', scale: 3.4)),
                SizedBox(height: 8.0),
                stylus('Emmanuel Produce', FontWeight.w500, 12,
                    textcolor: greenGrey),
                SizedBox(height: 4),
                stylus(
                  'Herbsconnect Organic Acai Berry Powder Freeze Dried',
                  FontWeight.w700,
                  14.5,
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    stylus('N35,000.00', FontWeight.w700, 14,
                        textcolor: orange),
                    SizedBox(width: 13.7),
                    stylus('In stock', FontWeight.w600, 16,
                        textcolor: darkGreen)
                  ],
                )
              ],
            ),
            Positioned(
              top: 8,
              left: 0.0,
              right: 8.0,
              child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('assets/images/image$num.png', scale: 24)
                    ],
                  )),
            ),
          ],
        ));
  }

  bottomSheet(context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder:
              (BuildContext context, void Function(void Function()) setState) {
            return Container(
              color: white,
              height: MediaQuery.of(context).size.height * 4 / 5,
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: stylus('Filter', FontWeight.w700, 24,
                        textcolor: darkGreen),
                    trailing: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  SizedBox(height: 24),
                  stylus('Vendor', FontWeight.bold, 16),
                  SizedBox(height: 24),
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
                  SizedBox(height: 24),
                  stylus('Sub Category', FontWeight.bold, 16),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(child: buildColumn()),
                      Container(child: buildColumn())
                    ],
                  ),
                  SizedBox(height: 16),
                  stylus('Price Range', FontWeight.bold, 16),
                  SizedBox(height: 16),
                  SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 2,
                    ),
                    child: RangeSlider(
                        activeColor: primaryGreen,
                        inactiveColor: hintTextColor,
                        min: 0,
                        max: 2000000,
                        values: values,
                        onChanged: (RangeValues value) {
                          setState(() {
                            print(values);
                            values = value;
                          });
                        }),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      expandedValues(values.start.toStringAsFixed(2)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.horizontal_rule),
                      ),
                      expandedValues(values.end.toStringAsFixed(2)),
                    ],
                  ),
                  SizedBox(height: 16),
                  actionButton(
                      'Apply Filter', primaryGreen, primaryGreen, white)
                ],
              ),
            );
          });
        });
  }

  expandedValues(String text) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        height: 60,
        decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              stylus(
                text,
                FontWeight.normal,
                18,
                textcolor: hintTextColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildInnerRow('Granular Fruits'),
        SizedBox(height: 16),
        buildInnerRow('Meats & Fish'),
        SizedBox(height: 16),
        buildInnerRow('Organic Food'),
        SizedBox(height: 16),
        buildInnerRow('Low-Carbs'),
      ],
    );
  }

  Row buildInnerRow(String text) {
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            value: checkboxVal,
            onChanged: (bool? value) {
              value = checkboxVal;
            },
          ),
        ),
        SizedBox(width: 16),
        stylus(text, FontWeight.w400, 16)
      ],
    );
  }
}
