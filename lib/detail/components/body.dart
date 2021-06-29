// import 'package:flutter/material.dart';
// import 'package:sap_trade/buy/buyScreen.dart';
// import 'package:sap_trade/detail/components/title_price.dart';
// import 'package:sap_trade/modals/sellers.dart';
// import '../../constants.dart';
// import 'image_pannel.dart';
//
// class Body extends StatelessWidget {
//   const Body({Key key, this.listSeller}) : super(key: key);
//
//   final List<Seller> listSeller;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           ImagePannel(size: size, imagePath: seller.imageURL,),
//           TitlePrice(title: seller.name, price: seller.price, location: seller.location),
//           Row(
//             children: [
//               SizedBox(
//                 width: size.width / 2,
//                 height: 84,
//                 child: FlatButton(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(20),
//                     ),
//                   ),
//                   color: kPrimaryColor,
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => BuyScreen()),
//                     );
//                   },
//                   child: Text(
//                     "Buy Now",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: FlatButton(
//                   onPressed: () {},
//                   child: Text("Description"),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
