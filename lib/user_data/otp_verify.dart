import 'package:eazy_shop/Home_screen/main_screen.dart';
import 'package:eazy_shop/user_data/otp_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPVerification extends StatelessWidget {
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
"assets/otp_verifing.jpg",width: MediaQuery.of(context).size.width*0.6,height: MediaQuery.of(context).size.height*0.3,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
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
                      style: GoogleFonts.montserrat(fontSize: 18.0,fontWeight: FontWeight.bold),
                    ),
                  ),
                  RichText(text: TextSpan(
                    text: "Enter the OTP sent to ",
                      style: GoogleFonts.montserrat(fontSize: 14.0,color: Colors.grey),
                    children: [
                      TextSpan(
                        text:"+91 - 9123456789 ",
                        style: TextStyle(color: Colors.black,fontSize: 14.0, fontWeight: FontWeight.bold)
                      )
                    ]
                  ),),
                  TextFormField(
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
                  RaisedButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => MainScreen()));
                  },
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
                    color: Colors.blueAccent,),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
