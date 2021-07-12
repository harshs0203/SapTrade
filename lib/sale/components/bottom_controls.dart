import 'package:flutter/material.dart';
import '../../constants.dart';

class BottomControls extends StatelessWidget {
  const BottomControls({
    Key key,
    @required this.size,
    this.formKey,
    @required this.nextScreen,
  }) : super(key: key);

  final Size size;
  final GlobalKey<FormState> formKey;
  @required
  final Widget nextScreen;

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
        Spacer(),
        Stack(
          children: [
            CircleAvatar(
              backgroundColor: kPrimaryColor,
              radius: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                  color: Colors.white,
                  alignment: Alignment.center,
                  icon: Icon(
                    Icons.arrow_forward,
                    size: size.width * 0.14,
                  ),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => nextScreen),
                      );
                    }
                  }),
            ),
          ],
        ),
      ],
    );
  }
}
