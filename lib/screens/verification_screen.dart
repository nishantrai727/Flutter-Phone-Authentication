// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:pinput/pin_put/pin_put.dart';

import './profilepage.dart';

class VerificationScreen extends StatefulWidget {
  final String phoneNum;

 VerificationScreen(this.phoneNum);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  String _verificationCode = "";

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${widget.phoneNum}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e);
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _verificationCode = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Verify Phone",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              width: 250,
              child: Text(
                "Code is sent to ${widget.phoneNum}",
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              child: Center(
                child: PinPut(
                  focusNode: _focusNode,
                  controller: _textEditingController,
                  fieldsCount: 6,
                  eachFieldHeight: 50,
                  eachFieldWidth: 50,
                  eachFieldAlignment: Alignment.center,
                  selectedFieldDecoration:
                      BoxDecoration(color: Color.fromRGBO(147, 210, 243, 1)),
                  followingFieldDecoration:
                      BoxDecoration(color: Color.fromRGBO(147, 210, 243, 1)),
                  submittedFieldDecoration:
                      BoxDecoration(color: Color.fromRGBO(147, 210, 243, 1)),
                  onSubmit: (pin) async {
                    try {
                      await FirebaseAuth.instance
                          .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: _verificationCode, smsCode: pin))
                          .then((value) async {
                        if (value.user != null) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileScreen()),
                              (route) => false);
                        }
                      });
                    } catch (e) {
                      FocusScope.of(context).unfocus();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('invalid OTP')));
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Didn't recieve the code? Request Again",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 70,
              decoration: BoxDecoration(color: Color.fromRGBO(46, 59, 98, 1)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(46, 59, 98, 1),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  _verifyPhone();
                },
                child: Text("VERIFY AND CONTINUE"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
