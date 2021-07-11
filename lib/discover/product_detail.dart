import 'package:flutter/material.dart';
import '../model/style_refactor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductDetail extends StatefulWidget {
  var imgPath, productTitle, manufacturer, productDetails, productAmount;
  ProductDetail(this.imgPath, this.productTitle, this.manufacturer,
      this.productDetails, this.productAmount);
  @override
  _ProductDetailState createState() => _ProductDetailState(
      this.imgPath,
      this.productTitle,
      this.manufacturer,
      this.productDetails,
      this.productAmount);
}

class _ProductDetailState extends State<ProductDetail> {
  var imgPath, productTitle, manufacturer, productDetails, productAmount;
  _ProductDetailState(this.imgPath, this.productTitle, this.manufacturer,
      this.productDetails, this.productAmount);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              Image.network(imgPath.toString(), scale: .1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    ListTile(
                      minVerticalPadding: 24,
                      horizontalTitleGap: 100,
                      contentPadding: EdgeInsets.zero,
                      title:
                          stylus(productTitle.toString(), FontWeight.bold, 24),
                      subtitle: stylus(
                          manufacturer.toString(), FontWeight.normal, 16,
                          textcolor: greenGrey),
                      trailing: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.favorite, color: fuschiaPink),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    stylus(productDetails.toString(), FontWeight.normal, 16),
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
                          stylus('N${productAmount.toString()}',
                              FontWeight.w700, 16),
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
                    GestureDetector(
                        child: Icon(Icons.keyboard_backspace,
                            color: white, size: 35),
                        onTap: () => Navigator.pop(context))
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
