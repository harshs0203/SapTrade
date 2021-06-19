import 'package:flutter/material.dart';

import '../../constants.dart';

class FormItems extends StatelessWidget {

  final Size size;
  final String title;
  final type;

  const FormItems({
    Key key,
    @required this.size, this.title, this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        TextFormField(
          keyboardType: type,
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
      ],
    );
  }
}

