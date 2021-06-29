// import 'dart:async';
// import 'package:flutter/material.dart';

// class AnimatedContainer extends StatefulWidget {
//
//   @override
//
//   State<AnimatedContainer> createState() => _AnimatedContainerState();
// }
//
// class _AnimatedContainerState extends State<AnimatedContainer> {
//   bool selected = false;
//
//   @override
//
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selected = !selected;
//           Timer.periodic(Duration(seconds: 2), (timer) {
//             selected = !selected;
//           });
//         });
//       },
//       child: Center(
//         child: AnimatedContainer(
//           width: selected ? 200.0 : 100.0,
//           height: selected ? 100.0 : 100.0,
//           decoration: BoxDecoration(
//           color: selected ? Colors.white : Color(0xFF0C9869),
//           borderRadius: BorderRadius.circular(40.0)),
//           alignment:
//           selected ? Alignment.centerLeft : AlignmentDirectional.centerStart,
//           duration: const Duration(seconds: 2),
//           curve: Curves.fastOutSlowIn,
//           child: const FlutterLogo(size: 75),
//         ),
//       ),
//     );
//   }
// }
