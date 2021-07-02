import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// colors
Color primaryGreen = Color(0xFF3A953C);
Color iconGreen = Color(0xFF00A051);
Color iconHolder = Color(0xFFE6F6EE);
Color secondaryGreen = Color(0xFF8AB543);
Color neonGreen = Color(0xFF0ACF83);
Color darkGreen = Color(0xFF3C673D);
Color greenGrey = Color(0xFF819272);
Color fuschiaPink = Color(0xFFBB2f48);
Color orange = Color(0xFFE75A21);
Color peachOrange = Color(0xFFF39E28);
Color facebook = Color(0xFF3D5B96);
Color white = Colors.white;
Color black = Color(0xFF10151A);
Color blackGrey = Color(0xFF3E3E3E);
Color grey = Color(0xFFF7F7F7);
Color hintTextColor = Color(0xFFBABABA);
Color red = Colors.red;
Color stepperColor = Color(0xFF999999);
int index = 2;

 stylus(String text, FontWeight weight, double size,
    {Color? textcolor, TextAlign? alignment, TextDecoration? decoration, double? letterspacing}) {
  return Text(text,
      textAlign: alignment,
      style: TextStyle(
        decoration: decoration,
          letterSpacing: letterspacing,
          fontWeight: weight,
          color: textcolor,
          fontSize: size,
          fontFamily: 'TTNorms pro'));
}

Widget ctaButton(String text, Color backgroundColor, IconData icon,
    Color borderColor, Color iconColor, Color textBColor,
    {onPressed}) {
  return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(icon, size: 20, color: iconColor),
          SizedBox(width: 16),
          stylus(
            text,
            FontWeight.w500,
            16,
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        side: BorderSide(width: 1.0, color: borderColor),
        onPrimary: textBColor,
        primary: backgroundColor,
        minimumSize: Size(88, 54),
        padding: EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ));
}

//text fields
Widget textInput(
  String hintText,
  controller,
  TextInputType type, {
  int? num,
  onchanged,
  FocusNode? focusNode,
  IconData? iconSuffix,
  icon,
}) {
  return Expanded(
    child: TextFormField(
        onChanged: onchanged,
        //autofocus: true,
        focusNode: focusNode,
        keyboardType: type,
        maxLength: num,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: Icon(
              iconSuffix,
              size: 24,
              color: hintTextColor,
            ),
            prefixIcon: icon,
            hintText: hintText,
            filled: true,
            fillColor: grey,
            hintStyle: TextStyle(color: hintTextColor, fontSize: 16),
            errorStyle: TextStyle(
              fontSize: 16.0,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.transparent)))),
  );
}

//Registration buttons
Widget actionButton(
    String text, Color backgroundColor, Color borderColor, Color textcolor,
    {ontap}) {
  return GestureDetector(
    child: Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(width: 1.3, color: borderColor),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Center(
          child: stylus(text, FontWeight.w700, 16, textcolor: textcolor)),
    ),
    onTap: ontap,
  );
}

//SingleChildScrolling
Container buildScrollText(Color color, String text, double width) {
  return Container(
      padding: EdgeInsets.all(20.0),
      height: 60,
      width: width,
      decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: stylus(
        text,
        FontWeight.w700,
        16,
        textcolor: color,
        alignment: TextAlign.center,
      ));
}

Row buildRow(String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      stylus(text, FontWeight.w700, 20, textcolor: darkGreen),
      Row(
        children: [
          stylus('View all', FontWeight.w500, 16, textcolor: hintTextColor),
          Icon(Icons.arrow_right_alt, color: hintTextColor)
        ],
      )
    ],
  );
}

Card buildPromoCard(Color color) {
  return Card(
    margin: EdgeInsets.only(right: 16),
    color: grey,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              stylus('Organic Brands', FontWeight.w700, 14,
                  textcolor: primaryGreen),
              stylus("exclusive\nbrands", FontWeight.w800, 30),
              SizedBox(height: 10),
              stylus("Visit our Shop for a complete\nlist of our products",
                  FontWeight.w500, 14,
                  textcolor: hintTextColor),
              SizedBox(height: 10),
              Row(
                children: [
                  stylus("Shop now    ", FontWeight.w700, 16, textcolor: color),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: color,
                    size: 16,
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(width: 20),
        Container(child: Image.asset('assets/images/basket.png', scale: 4.0))
      ],
    ),
  );
}

Container bestSellingCard(int num) {
  return Container(
      margin: EdgeInsets.only(right: 16.0),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              color: grey,
              child: Image.asset('assets/images/image$num.png', scale: 3.5)),
          SizedBox(height: 8.0),
          stylus('Emmanuel Produce', FontWeight.w500, 12, textcolor: greenGrey),
          SizedBox(height: 4),
          stylus(
            'Herbsconnect Organic\nAcai Berry Powder Freeze\nDried',
            FontWeight.w700,
            15,
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              stylus('N35,000.00', FontWeight.w700, 14, textcolor: orange),
              SizedBox(width: 13.7),
              stylus('In stock', FontWeight.w600, 16, textcolor: darkGreen)
            ],
          )
        ],
      ));
}

Container cartCard(onchanged, bool checkBoxVal, String headLine,
    String merchant, String price, String imagePath) {
  return Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          SizedBox(
            height: 26,
            width:20,
            child:
           Checkbox(
                value: checkBoxVal,
                activeColor: orange,
                checkColor: hintTextColor,
                onChanged: onchanged)),

        Container(
            margin: EdgeInsets.only(right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(height:12),
                stylus(
                  headLine,
                  FontWeight.w700,
                  18,
                ),
                SizedBox(height: 4),
                stylus(merchant, FontWeight.w500, 12, textcolor: greenGrey),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    stylus(price, FontWeight.w700, 16, textcolor: orange),
                    SizedBox(width: 16),
                    stylus('In stock', FontWeight.w600, 16,
                        textcolor: darkGreen)
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Container(
                        height: 34,
                        width: 36,
                        decoration: BoxDecoration(
                            color: grey,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(2))),
                        child:
                            Icon(Icons.remove, color: hintTextColor, size: 20)),
                    Container(
                        height: 34,
                        width: 36,
                        decoration: BoxDecoration(
                          color: grey,
                        ),
                        child: Center(
                            child: stylus('1', FontWeight.w500, 18,
                                textcolor: hintTextColor))),
                    Container(
                        height: 34,
                        width: 36,
                        decoration: BoxDecoration(
                            color: grey,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(2),
                                bottomRight: Radius.circular(2))),
                        child: Icon(Icons.add, color: hintTextColor, size: 20)),
                    SizedBox(width: 16),
                    Container(
                        height: 34,
                        width: 36,
                        decoration: BoxDecoration(
                            color: grey,
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        child: Icon(FontAwesomeIcons.trashAlt,
                            color: hintTextColor, size: 16))
                  ],
                )
              ],
            )),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(2))),
            child: Image.asset(imagePath, scale: 4.5))
      ],
    ),
  );
}

Widget buildVerifyPin(
    TextEditingController controller, onchanged, FocusNode focusNode) {
  return Expanded(
      child: Container(
          color: grey,
          height: 64.0,
          child: TextFormField(
              onChanged: onchanged,
              focusNode: focusNode,
              //autofocus: true,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              controller: controller,
              maxLength: 1,
              //cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  hintText: " ",
                  counterText: '',
                  hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)))));
}



