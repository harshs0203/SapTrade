import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sap_trade/services/authentication/google_sign_in.dart';
import 'package:sap_trade/services/database/dataBaseServices.dart';
import 'package:sap_trade/welcome/splash_screen.dart';
import '../../constants.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: kDefaultPadding *2,
        right: kDefaultPadding *2,
      ),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.35),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: SvgPicture.asset('assets/icons/flower.svg'),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.logout ,
              color: Colors.grey[400],
              ),
              onPressed: () {
                final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                );
              }),
          IconButton(
              icon: SvgPicture.asset('assets/icons/user-icon.svg'),
              onPressed: () {

              }),
        ],
      ),
    );
  }
}