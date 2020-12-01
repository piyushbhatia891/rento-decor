import 'dart:async';

import 'package:eazy_shop/user_data/user_mobile_verify.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => UserMobileVerify()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue,Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
            ),
            Image.asset("assets/logo.jpg"),

            Container(
              height: MediaQuery.of(context).size.height*0.2,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue,Colors.white],
                      end: Alignment.topCenter,
                      begin: Alignment.bottomCenter
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
