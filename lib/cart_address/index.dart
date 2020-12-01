import 'package:eazy_shop/success/index.dart';
import 'package:eazy_shop/utils/color/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartAddressPage extends StatefulWidget{
  CartAddressPageState createState()=>CartAddressPageState();
}
class CartAddressPageState extends State<CartAddressPage>{
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width*0.8,
          height: MediaQuery.of(context).size.height*0.1,
          child: Center(
            child: InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => SuccessPage()));
              },
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [HexColor("#0E96D9"),HexColor("#2273BB")]
                    )
                ),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Total Paid",style: TextStyle(color: Colors.white,fontSize: 16.0),),
                        Expanded(child: SizedBox(),),
                        Text("100",style: TextStyle(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.bold),)

                      ],
                    ),
                    Container(
                      width: 2.0,
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Checkout",style: TextStyle(fontSize: 18.0,color: Colors.white,fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, MediaQuery.of(context).size.height*0.08),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [HexColor("#2EB2F2"),HexColor("#2361AE")],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: ()=>Navigator.pop(context),
                    icon: Icon(
                      Icons.navigate_before,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                      "Address",
                      style: GoogleFonts.montserrat(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.w600)
                  ),
                  Expanded(child:SizedBox()),
                  Row(
                    children: [

                      Icon(
                        Icons.notification_important_outlined,
                        size: 24,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(text: TextSpan(
                        text: "Select Address :",
                          style: TextStyle(color: Color(0xFF656565),fontWeight: FontWeight.bold,fontSize: 16.0),
                        children: [
                          TextSpan(
                            text: "ABC, EFG, XYZ,Street, Coner Side",
                            style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)
                          )
                        ]
                      ),),
                      RichText(text: TextSpan(
                          text: "City :",
                          style: TextStyle(color: Color(0xFF656565),fontWeight: FontWeight.bold,fontSize: 16.0),
                          children: [
                            TextSpan(
                                text: "",
                                style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)
                            )
                          ]
                      ),),
                      RichText(text: TextSpan(
                          text: "State:",
                          style: TextStyle(color: Color(0xFF656565),fontWeight: FontWeight.bold,fontSize: 16.0),
                          children: [
                            TextSpan(
                                text: "",
                                style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)
                            )
                          ]
                      ),),
                      RichText(text: TextSpan(
                          text: "Pincode:",
                          style: TextStyle(color: Color(0xFF656565),fontWeight: FontWeight.bold,fontSize: 16.0),
                          children: [
                            TextSpan(
                                text: "",
                                style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)
                            )
                          ]
                      ),),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Enter Coupon Code"
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){

                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text("Apply",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [HexColor("#2DA3DE"),HexColor("#206AB5")]
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  height: MediaQuery.of(context).size.height*0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Order Total",style:  TextStyle(color: Color(0xFF767676))),
                          Text("Rs. 400.00"
                            ,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Rento Decor Discount",style:  TextStyle(color: Color(0xFF767676))),
                          Text("Rs. 50.00"
                            ,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Coupon Discount",style:  TextStyle(color: Color(0xFF767676))),
                          Text("Rs. 00"
                            ,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Shipping",style:  TextStyle(color: Color(0xFF767676))),
                          Text("Rs. 50.0"
                            ,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)

                        ],
                      ),

                    ],
                  ),
                ),
                Divider(),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("To be Paid",style: TextStyle(color: Colors.grey),),
                          Text("Rs. 400.00"
                            ,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)
                        ],
                      ),

                    ],
                  ),
                ),
                Expanded(child: SizedBox())
              ],
            ),
          ),
        ),
      ),
    );
  }
}