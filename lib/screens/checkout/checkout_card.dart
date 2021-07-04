import 'package:aduaba_fresh/model/slide.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:aduaba_fresh/model/style_refactor.dart';
import 'package:flutter_svg/svg.dart';
import 'checkout_confirmed.dart';

class CheckoutCard extends StatefulWidget {
  @override
  _CheckoutCardState createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardExpiryController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  int currentIndex = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    double stepper = MediaQuery.of(context).size.width / 2.6;
    final tab = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: primaryGreen,
              radius: 10,
            ),
            Container(height: 4, width: stepper, color: primaryGreen),
            CircleAvatar(
              backgroundColor: primaryGreen,
              radius: 10,
            ),
            Container(height: 4, width: stepper, color: stepperColor),
            CircleAvatar(
                backgroundColor: stepperColor,
                radius: 10,
                child: CircleAvatar(
                  backgroundColor: white,
                  radius: 7,
                )),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            stylus('Billing', FontWeight.normal, 16, textcolor: stepperColor),
            SizedBox(width: 8),
            stylus('Payment', FontWeight.normal, 16, textcolor: stepperColor),
            stylus('Confirmation', FontWeight.normal, 16,
                textcolor: stepperColor)
          ],
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: Colors.white,
        leading: SizedBox(
          height: 35,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
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
              horizontal: 16.0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    stylus('Checkout', FontWeight.w700, 24,
                        textcolor: greenGrey),
                  ],
                ),
                SizedBox(height: 16.0),
                tab,
                SizedBox(height: 16.0),

              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    stylus('Payment', FontWeight.w700, 26),
                    GestureDetector(
                      child: Row(
                        children: [
                          Icon(Icons.add, color: blackGrey),
                          stylus('Add New Card', FontWeight.w400, 16,
                              textcolor: blackGrey)
                        ],
                      ),
                      onTap: () {
                        onpressed();
                      },
                    )
                  ],
                ),
              ),
              Container(
                child: CarouselSlider(
                    options: CarouselOptions(
                        height: 250,
                        aspectRatio: 2.0,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        pageSnapping: true,
                        reverse: false,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        }),
                    items: items.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  padding: EdgeInsets.all(24),
                                  width: 500,
                                  height: 180,
                                  decoration: BoxDecoration(
                                      color: Color(int.parse(i[6])),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(13),
                                      )),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          top: 5,
                                          left: 5,
                                          right: 0,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(i[0]),
                                              SizedBox(height: 24),
                                              stylus(i[1], FontWeight.w500, 16,
                                                  textcolor: white,
                                                  letterspacing: 2),
                                              SizedBox(height: 23),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    stylus(i[2],
                                                        FontWeight.w500, 13,
                                                        textcolor: white),
                                                    stylus(i[3],
                                                        FontWeight.w400, 13,
                                                        textcolor: white),
                                                  ]),
                                              SizedBox(height: 8),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  stylus(
                                                      i[4], FontWeight.w500, 16,
                                                      textcolor: white),
                                                  stylus(
                                                      i[5], FontWeight.w600, 14,
                                                      textcolor: white),
                                                ],
                                              ),
                                            ],
                                          )),
                                    ],
                                  )),
                              SizedBox(height: 8),
                            ],
                          );
                        },
                      );
                    }).toList()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(items, (index, card) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIndex == index ? Color(int.parse(items[currentIndex][6])) : hintTextColor,
                    ),
                  );
                }),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 8 / 13,
            left: 0.0,
            right: 0.0,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: white,
                  child: actionButton(
                      'Pay Now', primaryGreen, primaryGreen, white, ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckoutConfirmed()));
                  }),
                )),
          )
        ],
      ),
    );
  }

  onpressed() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return FractionallySizedBox(
              heightFactor: 0.75,
              child: Form(
                  child: ListView(padding: EdgeInsets.all(16), children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    stylus('New Card', FontWeight.w700, 26,
                        textcolor: darkGreen),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close))
                  ],
                ),
                SizedBox(height: 16),
                stylus(
                  'Name on card',
                  FontWeight.w700,
                  16,
                ),
                SizedBox(height: 16),
                textInput(
                  'type full name',
                  nameController,
                  TextInputType.text,
                ),
                SizedBox(height: 16),
                stylus('Card Number', FontWeight.w700, 16),
                SizedBox(height: 16),
                textInput(
                    '16 digits', cardNumberController, TextInputType.number),
                SizedBox(height: 16),
                stylus('Expiry Date', FontWeight.w700, 16),
                SizedBox(height: 16),
                textInput(
                  'mm/yy',
                  cardExpiryController,
                  TextInputType.number,
                ),
                SizedBox(height: 16),
                stylus('CVV', FontWeight.w700, 16),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: textInput(
                      '3 digits', cvvController, TextInputType.number),
                ),
                SizedBox(height: 16),
                actionButton(
                  'Save',
                  primaryGreen,
                  primaryGreen,
                  white,
                  ontap: () {
                    Navigator.pop(context);
                  },
                ),
              ])));
        });
  }
}
