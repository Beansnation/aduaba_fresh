import 'package:aduaba_fresh/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final List<List<String>> texts = [
    [
      'assets/images/OnBoarding1.png',
      'Explore Fresh Organic Products Everyday',
      'Search through a variety of products that help you keep fit and healthy'
    ],
    [
      'assets/images/OnBoarding2.png',
      'Eat Healthy, Spend Wisely. Be Happy',
      'Discover products by our vendors at very affordable prices'
    ],
    [
      'assets/images/OnBoarding3.png',
      'Fast Delivery Within 24 Hours Of Purchase',
      'Worried about time? Don\'t stress, our products are at our door step before sunset'
    ]
  ];

  int currentIndex = 0;

  void _next() {
    setState(() {
      if (currentIndex < texts.length - 1) {
        currentIndex++;
      } else {
        currentIndex = currentIndex;
      }
    });
  }

  void _preve() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            GestureDetector(
              onHorizontalDragEnd: (DragEndDetails details) {
                if (details.velocity.pixelsPerSecond.dx > 0) {
                  _preve();
                } else if (details.velocity.pixelsPerSecond.dx < 0) {
                  _next();
                }
              },
              child: FadeAnimation(
                .8,
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(texts[currentIndex][0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Spacer(),
                        Expanded(
                          child: FadeAnimation(
                            1,
                            Container(
                              //width: double.infinity,
                              padding: EdgeInsets.all(25),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  //SLIDER DOTS SECTION
                                  FadeAnimation(
                                    1,
                                    Container(
                                      width: 70,
                                      margin: EdgeInsets.only(bottom: 20),
                                      child: Row(
                                        children: _buildIndicator(),
                                      ),
                                    ),
                                  ),
                                  //END OF SLIDER DOTS SECTION
                                  FadeAnimation(
                                    1.3,
                                    Text(
                                      texts[currentIndex][1],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  FadeAnimation(
                                    1.4,
                                    Text(
                                      texts[currentIndex][2],
                                      style: TextStyle(
                                          color: Colors.white,
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  FadeAnimation(
                                      1.7,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          FlatButton(
                                            child: Text(
                                              'Get Started',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            padding: const EdgeInsets.all(15),
                                            color: Colors.green[600],
                                            textColor: Colors.white,
                                            onPressed: () {
                                              //Navigator.of(context).pushNamed(SignupScreen.routeName);
                                            },
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                'Have an account already?',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              FlatButton(
                                                child: Text(
                                                  'Sign In',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  //Navigator.of(context).pushNamed(LoginScreen.routeName);
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
    for (int i = 0; i < texts.length; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}
