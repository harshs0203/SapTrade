import 'package:flutter/material.dart';

import '../../constants.dart';

double currentSliderValue = 50;
String label;

// ignore: must_be_immutable
class CustomSlider extends StatefulWidget {
  const CustomSlider({Key key, @required this.sliderName, @required this.numberOfDivisions}) : super(key: key);


  @override
  _CustomSliderState createState() => _CustomSliderState();
  final String sliderName;
  final int numberOfDivisions;
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.sliderName+'\t'':',
          style: TextStyle(
            fontSize: 15.0,
          ),
          ),
          Slider(
            activeColor: kPrimaryColor,
            inactiveColor: Colors.grey.shade400,
            value: currentSliderValue,
            min: 0,
            max: 100,
            divisions: widget.numberOfDivisions,
            label: label,
            onChanged: (double value) {
              setState(() {
                currentSliderValue = value;
                label = labelString(currentSliderValue);
              });
            },
          ),
        ],
      ),
    );
  }

  String labelString(double currentSliderValue) {
    String label;

    if (currentSliderValue <= 20.0) {
      label = 'very low';
    } else if (currentSliderValue <= 40.0) {
      label = 'low';
    } else if (currentSliderValue <= 60.0) {
      label = 'normal';
    } else if (currentSliderValue <= 80.0) {
      label = 'high';
    } else if (currentSliderValue <= 100.0) {
      label = 'very high';
    } else {
      label = 'invalid';
    }

    return label;
  }
}
