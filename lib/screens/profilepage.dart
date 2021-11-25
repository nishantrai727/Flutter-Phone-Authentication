// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../screens/homepage.dart';

class ProfileScreen extends StatelessWidget {
  final int val = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Please select your profile",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1)),
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Radio(
                      activeColor: Colors.black,
                      focusColor: Colors.black,
                      splashRadius: 40,
                      value: 1,
                      groupValue: val,
                      onChanged: (_) {},
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/vector4.png"),
                            scale: 0.7)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shipper",
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1)),
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Radio(
                      toggleable: false,
                      activeColor: Colors.black,
                      focusColor: Colors.black,
                      value: 1,
                      groupValue: val,
                      onChanged: (_) {},
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/vector5.png"),
                            scale: 0.7)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Transporter",
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(color: Color.fromRGBO(46, 59, 98, 1)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(46, 59, 98, 1),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => HomePage()));
                },
                child: Text("CONTINUE"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
