import 'package:aduaba_fresh/registration/sign_in.dart';
import 'package:aduaba_fresh/registration/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:aduaba_fresh/model/style_refactor.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  int currentIndex = 0;
  List<Widget> itemzzz = [
    [
      'assets/images/OnBoarding1.png',
      'Explore Fresh Organic\nProducts Everyday',
      'Search through a variety of products that help you keep fit and healthy'
    ],
    [
      'assets/images/OnBoarding2.png',
      'Eat Healthy, Spend Wisely.\nBe Happy',
      'Discover products by our vendors at very affordable prices',
    ],
    [
      'assets/images/OnBoarding3.png',
      'Fast Delivery Within 24\nHours Of Purchase',
      'Worried about time? Don\'t stress, our products are at our door step before sunset',
    ]
  ].map((i) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(i[0]),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: 300,
              child: Column(
                children: [
                  Spacer(
                    flex: 5
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 500,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                       Row(children: []
                     //  _buildIndicator()
                       ),
                          SizedBox(
                            height: 16,
                          ),
                          stylus(i[1], FontWeight.bold, 24, textcolor: white),
                          SizedBox(
                            height: 16,
                          ),
                          stylus(i[2], FontWeight.w400, 17, textcolor: white),
                          SizedBox(
                            height: 48,
                          ),
                          actionButton(
                            'Get Started', primaryGreen, primaryGreen, white, ontap: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => SignUp()));
                          }),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              stylus('Have an account already?', FontWeight.w500, 16,
                                  textcolor: white),
                              SizedBox(
                                width: 4,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => SignIn()));
                                },
                                  child: stylus('Sign In', FontWeight.w700, 16, textcolor: white)),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }).toList();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: black,
      body: Container(
          child: CarouselSlider(
              items: itemzzz,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 1.0,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                //  onPageChanged: (){},
                scrollDirection: Axis.horizontal,
              ))),
    );
  }

  Widget _indicator(bool isActive) {
    return Expanded(
      child: Container(
        height: 10,
        // padding: EdgeInsets.only(right: 2),
        // margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? Colors.green : Colors.white),
      ),
    );
  }

 List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < itemzzz.length; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }

}
