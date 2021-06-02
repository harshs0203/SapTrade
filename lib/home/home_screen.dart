import 'package:flutter/material.dart';
import 'package:sap_trade/constants.dart';
import 'package:sap_trade/home/components/body.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/BottomNavigationBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: BottomBar(),
    );
  }
}



AppBar buildAppBar() {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: () {},
    ),
  );
}
