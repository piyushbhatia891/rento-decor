import 'package:eazy_shop/cart/index.dart';
import 'package:eazy_shop/utils/color/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      "Order",
                      style: GoogleFonts.montserrat(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.w600)
                  ),
                  Expanded(child:SizedBox()),
                  Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => CartPage()));
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
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
        body: ListView.builder(itemBuilder: (context,int index){
          return Container(
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height*0.12,
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 2.0,
                      offset: Offset(0.0, 0.75)
                  )
                ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: HexColor("#90C416"),
                    borderRadius: BorderRadius.circular(40.0)
                  ),
                  child: Icon(Icons.home,color: Colors.white),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order #123456",style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold), ),
                      Text("Delivered",style: TextStyle(color: HexColor("#90C416")), )

                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("View 3 Items",style: TextStyle(color: HexColor("#90C416")), ),
                      Text("10 July, 2020 | 03 pm",style: TextStyle(color: Colors.black), ),



                    ],
                  ),
                ),
              ],
            ),
          ) ;
        },padding: const EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}
