// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:easyapp/screens/verification_screen.dart';
import 'package:flag/flag.dart';

import 'package:flutter/material.dart';

class Entrypage extends StatefulWidget {
  const Entrypage({Key? key}) : super(key: key);

  @override
  State<Entrypage> createState() => _EntrypageState();
}

class _EntrypageState extends State<Entrypage> {
  
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Please enter your mobile number",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            width: 250,
            child: Text(
              "You'll recieve a 4 digit code to verify next.",
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flag.fromString(
                  "IN",
                  height: 30,
                  width: 30,
                ),
                Text(
                  "+91",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  "-",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                ),
                Container(
                  height: 50,
                  width: 200,
                  child: TextField(
                    // controller: _textEditingController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: "Mobile Number",
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) =>
                        VerificationScreen(_textEditingController.text)));
              },
              child: Text("CONTINUE"),
            ),
          )
        ],
      )),
    );
  }
}
