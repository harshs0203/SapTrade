import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sap_trade/constants.dart';
import 'package:sap_trade/home/home_screen.dart';


//TODO: Fix CheckBox.


class AdditionalInformation extends StatefulWidget {
  @override
  _AdditionalInformationState createState() => _AdditionalInformationState();
}

class _AdditionalInformationState extends State<AdditionalInformation> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool checked = false;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(kDefaultPadding),
          margin: EdgeInsets.only(top: size.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Additional Information',
                style: TextStyle(fontSize: 40.0),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                'Price:',
                style: TextStyle(fontSize: 35),
              ),
              Container(
                width: size.width * 0.5,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixText: '₹',
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                secondary: Icon(Icons.emoji_emotions),
                activeColor: kPrimaryColor,
                title: Text('I want to donate ₹10 to plant a tree!'),
                value: checked,
                onChanged: (bool newValue) {
                  setState(() {
                    if(!checked) {
                      checked = newValue;
                    }else{
                      checked = true;
                    }
                    print(checked);
                  });
                },
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                'Other Information:',
                style: TextStyle(fontSize: 35),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: size.height * 0.25),
              Container(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Text('Upload')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
