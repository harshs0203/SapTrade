import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';

class AnimatedProperties extends StatefulWidget {
  const AnimatedProperties({Key key, this.image, this.iconText})
      : super(key: key);

  @override
  State<AnimatedProperties> createState() => _AnimatedPropertiesState();
  final image;
  final iconText;
}

class _AnimatedPropertiesState extends State<AnimatedProperties> {
  final String image;
  final iconText;
  bool selected = false;

  _AnimatedPropertiesState({this.iconText, this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.03),
          padding: EdgeInsets.all(kDefaultPadding / 2.5),
          width: selected ? 100 : 62,
          height: selected ? 62 : 62,
          decoration: BoxDecoration(
            color: selected ? Colors.white : Color(0xFF0C9869),
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 15),
                blurRadius: 20,
                color: kPrimaryColor.withOpacity(0.20),
              ),
              BoxShadow(
                offset: Offset(-15, -15),
                blurRadius: 20,
                color: Colors.white,
              ),
            ],
          ),
          alignment: selected
              ? Alignment.centerLeft
              : AlignmentDirectional.centerStart,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: selected
              ? IconButton(icon: SvgPicture.asset(image.toString()), onPressed: () {
                setState(() {
                  selected = !selected;
                });

          })
              : Row(
                  children: [
                    IconButton(

                        icon: SvgPicture.asset(image.toString()), onPressed: () {
                      setState(() {
                        selected = !selected;
                      });
                    }),
                    Text(iconText.toString()),
                  ],
                )),
    );
  }
}
