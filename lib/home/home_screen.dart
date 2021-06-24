import 'package:flutter/material.dart';
import 'package:sap_trade/sale/Screens/PersonalDetails.dart';
import 'package:sap_trade/home/components/body.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/BottomNavigationBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: BottomBar(),
    );
  }
}

AppBar buildAppBar(context) {
  return AppBar(
    elevation: 0,
    leading: Row(
      children: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PersonalDetail()),
            );
          },
        ),
      ],
    ),
  );
}
