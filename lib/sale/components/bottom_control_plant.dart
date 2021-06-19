import 'package:flutter/material.dart';
import '../../constants.dart';

class BottomControlPlant extends StatelessWidget {
  const BottomControlPlant({
    Key key,
    @required this.size,
    @required this.nextScreen,
  }) : super(key: key);

  final Size size;
  @required final Widget nextScreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundColor: kPrimaryColor,
              radius: 35,
            ),
            IconButton(
                color: Colors.white,
                alignment: Alignment.center,
                icon: Icon(
                  Icons.arrow_back,
                  size: size.width * 0.14,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
        SizedBox(
          width: size.width * 0.557,
        ),
        Stack(
          children: [
            CircleAvatar(
              backgroundColor: kPrimaryColor,
              radius: 35,
            ),
            IconButton(
                color: Colors.white,
                alignment: Alignment.center,
                icon: Icon(
                  Icons.arrow_forward,
                  size: size.width * 0.14,
                ),
                onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => nextScreen),
                    );

                }),
          ],
        ),
      ],
    );
  }
}
