import 'package:flutter/material.dart';

import '../../constants.dart';

class BottomControls extends StatelessWidget {
  const BottomControls({
    Key key,

    @required this.size, this.formKey,
  }) : super(key: key);

  final Size size;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            color: kPrimaryColor,
            alignment: Alignment.centerRight,
            icon: Icon(
              Icons.arrow_back,
              size: size.width * 0.14,
            ),
            onPressed: () {
              //Navigator.pop(context);
            }),
        SizedBox(
          width : size.width *0.63,
        ),
        IconButton(
            alignment: Alignment.centerLeft,
            icon: Icon(
              Icons.arrow_forward,
              color: kPrimaryColor,
              size: size.width * 0.14,
            ),
            onPressed: () {
              if (!formKey.currentState.validate()) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
            }),
      ],
    );
  }
}
