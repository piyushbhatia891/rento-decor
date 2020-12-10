import 'package:eazy_shop/Home_screen/main_screen.dart';
import 'package:eazy_shop/network/client_functions.dart';
import 'package:eazy_shop/user_data/otp_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPVerification extends StatefulWidget {
  OTPVerificationState createState() => OTPVerificationState();
}

class OTPVerificationState extends State<OTPVerification> {
  String otp = '';
  String mobile = '';
  SharedPreferences _preferences;
  void initState() {
    super.initState();
    setPreferenceValue();
  }

  setPreferenceValue() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {
      mobile = _preferences.getString("mobile");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              child: Image.asset(
                "assets/otp_verifing.jpg",
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(10.0),
              decoration: new BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: new BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 10),
                    child: Text(
                      "OTP Verifing",
                      style: GoogleFonts.montserrat(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Enter the OTP sent to ",
                        style: GoogleFonts.montserrat(
                            fontSize: 14.0, color: Colors.grey),
                        children: [
                          TextSpan(
                              text: "${mobile}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                  TextFormField(
                    initialValue: otp,
                    onChanged: (val) {
                      setState(() {
                        otp = val;
                      });
                    },
                    style: TextStyle(fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: InputDecoration(
                        labelText: "Please Enter The OTP received",
                        icon: Icon(Icons.phone_iphone)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Dont receive the OTP?",
                        style: GoogleFonts.montserrat(
                            fontSize: 14.0, color: Colors.grey),
                        children: [
                          TextSpan(
                              text: " RESEND OTP",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  VerifyButton(
                    otp: otp,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerifyButton extends StatefulWidget {
  final String otp;
  VerifyButton({this.otp});
  VerifyButtonState createState() => VerifyButtonState();
}

class VerifyButtonState extends State<VerifyButton> {
  String buttonText = "Continue";
  bool enabled = true;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: enabled
          ? () async {
              setState(() {
                buttonText = "Loading..";
                enabled = false;
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => MainScreen()));
            }
          : null,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: new Text(
          'Continue',
          style: new TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      color: Colors.blueAccent,
    );
  }
}
