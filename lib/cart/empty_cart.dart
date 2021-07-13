import 'package:aduaba_fresh/discover/discover.dart';
import 'package:flutter/material.dart';
import '../bottom_navbar.dart';
import '../model/style_refactor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class EmptyCart extends StatefulWidget {
//   @override
//   _EmptyCartState createState() => _EmptyCartState();
// }
//
// class _EmptyCartState extends State<EmptyCart> {
//   @override
//   Widget build(BuildContext context) {
//     final tab = Container(
//       padding: EdgeInsets.all(16),
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(color: white, boxShadow: [
//         BoxShadow(
//             color: black.withOpacity(0.1),
//             spreadRadius: 2,
//             blurRadius: 20,
//             offset: Offset(0, 2))
//       ]),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 28,
//           ),
//           Icon(
//             Icons.keyboard_backspace,
//             color: black,
//             size: 35.0,
//           ),
//           SizedBox(height: 8),
//           stylus('Cart', FontWeight.w700, 24, textcolor: greenGrey),
//           SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               stylus('0 items listed', FontWeight.w500, 15,
//                   textcolor: hintTextColor),
//               Row(
//                 children: [
//                   Icon(
//                     Icons.check,
//                     color: hintTextColor,
//                   ),
//                   stylus('Select All', FontWeight.w500, 15,
//                       textcolor: hintTextColor),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Icon(FontAwesomeIcons.trashAlt,
//                       size: 16, color: hintTextColor),
//                   stylus('Delete Selected', FontWeight.w500, 15,
//                       textcolor: hintTextColor),
//                 ],
//               )
//             ],
//           )
//         ],
//       ),
//     );
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 5.0,
//         backgroundColor: Colors.white,
//         leading: SizedBox(
//           height: 35,
//           child: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               Icons.keyboard_backspace,
//               color: Colors.black,
//               size: 35.0,
//             ),
//           ),
//         ),
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(80.0),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 16.0,
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     stylus('Cart', FontWeight.w700, 24, textcolor: greenGrey),
//                   ],
//                 ),
//                 SizedBox(height: 16.0),
//                 tab,
//                 SizedBox(height: 16.0),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNav(),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Container(
//               margin: EdgeInsets.all(MediaQuery.of(context).size.width / 6),
//               width: 300,
//               child: Column(
//                 children: [
//                   Image.asset(
//                     'assets/images/emptycart.png',
//                     scale: 4,
//                     color: greenGrey.withOpacity(0.5),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: stylus('Your cart is empty', FontWeight.w700, 24,
//                         alignment: TextAlign.center),
//                   ),
//                   stylus('Hit the green button down below to create an order',
//                       FontWeight.w500, 16,
//                       alignment: TextAlign.center),
//                 ],
//               ),
//             ),
//             Positioned(
//                 top: MediaQuery.of(context).size.width * 6 / 7,
//                 left: 0.0,
//                 right: 0.0,
//                 child: BottomFloat()),
//           ],
//         ),
//       ),
//     );
//   }
// }

class BottomFloatEmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // SizedBox(height: 16),
              actionButton('Start Ordering', primaryGreen, primaryGreen, white,
                  ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Discover()));
              }),
              // SizedBox(height: 16),
            ],
          ),
        ));
  }
}
