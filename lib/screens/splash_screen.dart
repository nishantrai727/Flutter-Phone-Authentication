// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../screens/entrypage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/vector1.png"),
                      )),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Please select your Language",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 250,
                      child: Text(
                        "You can change the language at any time",
                        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      width: 280,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                      ),
                      child: DropdownButton(
                        
                        borderRadius: BorderRadius.zero,
                        elevation: 0,
                        isExpanded: true,
                        iconSize: 50,
                        iconEnabledColor: Colors.black,
                        iconDisabledColor: Colors.black,
                        hint: Text("English"),
                        items: ["English", "Hindi", "Spanish"].map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Container(
                                  height: 60,
                                  width: 300,
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.black),
                                  ),
                                  child: Text(val)),
                            );
                          },
                        ).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      width: 280,
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(46, 59, 98, 1)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(46, 59, 98, 1),
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Entrypage()));
                        },
                        child: Text("NEXT"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 90),
              child: Stack(
                children: [
                  Container(
                    // height: 200,

                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage("assets/images/vector3.png"))),
                  ),
                  Container(
                    // height: 300,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage("assets/images/vector2.png"))),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
