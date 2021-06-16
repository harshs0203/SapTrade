import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class PersonalDetail extends StatelessWidget {
  const PersonalDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: kDefaultPadding,
              right: kDefaultPadding,
              bottom: kDefaultPadding,
              left: kDefaultPadding / 2),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                "Enter Your Personal Details Here",
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                height: size.height*0.08,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text('Name'),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height*0.04,
                    ),
                    Text('Location'),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height*0.04,
                    ),
                    Text('Address'),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height*0.04,
                    ),
                    Text('Phone Number'),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                      color: kPrimaryColor,
                      alignment: Alignment.center,
                      icon: Icon(
                        Icons.arrow_back,
                        size: size.width * 0.14,
                      ),
                      onPressed: () {
                        //Navigator.pop(context);
                      }),
                  IconButton(
                      alignment: Alignment.center,
                      icon: Icon(
                        Icons.arrow_forward,
                        color: kPrimaryColor,
                        size: size.width * 0.14,
                      ),
                      onPressed: () {
                        //Navigator.pop(context);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
