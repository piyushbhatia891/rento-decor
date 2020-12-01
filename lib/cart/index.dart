import 'package:eazy_shop/cart_address/index.dart';
import 'package:eazy_shop/success/index.dart';
import 'package:eazy_shop/utils/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatefulWidget{
  CartPageState createState()=>CartPageState();
}
class CartPageState extends State<CartPage>{
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
                    MaterialPageRoute(builder: (ctx) => CartAddressPage()));
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
                      "Cart",
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
        body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context,int index){
          return Container(
            width: MediaQuery.of(context).size.width*0.7,
            height: MediaQuery.of(context).size.height*0.10,
            margin: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 0.75)
                  )
                ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(

                  child: Image.asset("assets/sofa.jpg"),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Plastic Chair",style: TextStyle(color: Colors.grey,fontSize: 18.0,fontWeight: FontWeight.bold), ),
                      Text("Function",style: TextStyle(color: Colors.grey.shade600,fontSize: 12.0,fontWeight: FontWeight.bold) ),
                      Expanded(child: SizedBox()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("assets/rupee_sign.jpg",width: 10.0,height: 10.0,),
                          Expanded(child: Text("100",style: TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold),)),
                          Text(" - ",style: TextStyle(fontSize: 16.0,color: Colors.black),),
                          InkWell(
                            onTap: (){
                              showDialog(context: context,builder: (context){
                                return AlertDialog(
                                  title: Text("Update Qunatity"),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  content: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Enter The Quantity"
                                    ),
                                  ),
                                  actions: [
                                    RaisedButton(onPressed: (){
                                      Navigator.pop(context);
                                    },color:Colors.blue,

                                      child: Center(child: Text("Ok", style: TextStyle(color: Colors.white,fontSize: 16.0),),),)
                                  ],
                                );
                              });
                            },
                              child: Text(" 2 ",style: TextStyle(fontSize: 16.0,color: Colors.black),)),
                          Text(" + ",style: TextStyle(fontSize: 16.0,color: Colors.black),),
                        ],
                      ),

                    ],
                  ),
                )
              ],
            ),
          ) ;
        },padding: const EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}