import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sap_trade/constants.dart';

class ShowDetails extends StatelessWidget {
  final Function addTaskCallBack;
  final String details;

  ShowDetails({this.addTaskCallBack, this.details});

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
      color: Color(0Xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Details:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              details,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              alignment: Alignment.centerRight,
              // ignore: deprecated_member_use
              child: FlatButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                onPressed: () {
                  addTaskCallBack(newTaskTitle);
                },
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                ),
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
