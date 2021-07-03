import 'package:flutter/material.dart';
import '../model/style_refactor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              Image.asset('assets/images/search3.png', scale: .1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    ListTile(
                      minVerticalPadding: 24,
                      horizontalTitleGap: 100,
                      contentPadding: EdgeInsets.zero,
                      title: stylus(
                          'Herbsconnect Organic Acai Berry Powder Freeze Dried',
                          FontWeight.bold,
                          24),
                      subtitle: stylus(
                          'Emmanuel produce', FontWeight.normal, 16,
                          textcolor: greenGrey),
                      trailing: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.favorite, color: fuschiaPink),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    stylus(
                        'Lal Qilla Diabetes and Obesity Basmati Rice 5kg. Using a unique technique during cultivation and processing, Lal Qilla has introduced a specially processed low G.I. parboiled rice. This remarkable rice helps rice lovers with diabetes to ',
                        FontWeight.normal,
                        16),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        stylus('MORE DETAILS', FontWeight.normal, 16),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(Icons.add)
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          stylus('N35,000.00', FontWeight.w700, 16),
                          actionButton(
                              'Add to cart', primaryGreen, primaryGreen, white),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 48,
            left: 8.0,
            right: 0.0,
            child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(child: Icon(Icons.keyboard_backspace, color: white, size: 35),
                    onTap: ()=>Navigator.pop(context)
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
