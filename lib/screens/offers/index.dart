import 'package:eazy_shop/cart/index.dart';
import 'package:eazy_shop/utils/color/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OffersPage extends StatefulWidget{
  OffersPageState createState()=>OffersPageState();
}
class OffersPageState extends State<OffersPage>{
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(

        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.grey.shade300,
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.2,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [HexColor("#2EB2F2"),HexColor("#2361AE")],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight
                  ),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10.0),
                  right: Radius.circular(10.0)
                )
              ),
            ),
            Positioned(
              left: 20.0,
              right: 20.0,
              child: Container(
                height: MediaQuery.of(context).size.height*0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: ()=>Navigator.pop(context),
                      icon: Icon(
                        Icons.navigate_before,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(child: Text(
                        "Offers",
                        style: GoogleFonts.montserrat(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.w600)
                    )),
                    Icon(Icons.notification_important_outlined,color: Colors.white,)
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height*0.15,
              left: 20.0,
              right: 20.0,
              child: Container(
                padding: const EdgeInsets.all(30.0),
                height: MediaQuery.of(context).size.height*0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,

                ),
                child: Column(
                  mainAxisAlignment:  MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Image.asset("assets/sofa.jpg",fit: BoxFit.cover,)),
                    Text("Flat 20% of f on your rental products limited offer book now!"),
                    SizedBox(height: 10.0,),
                    Text("On Shop Anniversary",style: TextStyle(color: HexColor("#FFCC00")),),
                    SizedBox(height: 10.0,),
                    Text("Offers 20% Off",style: TextStyle(color: Colors.blue,fontSize:24.0,fontStyle: FontStyle.italic),),
                    Container(child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Click Here",textAlign: TextAlign.end,),
                        Icon(Icons.arrow_forward_ios,color:Colors.grey,size: 12.0,)
                      ],
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}