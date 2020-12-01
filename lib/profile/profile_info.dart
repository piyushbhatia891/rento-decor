import 'package:eazy_shop/cart/index.dart';
import 'package:eazy_shop/utils/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    //double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                      "Profile",
                      style: GoogleFonts.montserrat(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.w600)
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: new AssetImage(
                          "assets/face.jpg")
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Text("Name",style: TextStyle(color: Colors.grey.shade400,fontSize: 16.0)),
                  IconButton(icon: Icon(Icons.edit), onPressed: (){
                    showDialog(context: context,builder: (context){
                      return UpdateWidget(header: "Update Name",textLabel: "Enter Name ",);
                    });
                  })]),
              Text("Neha",style: TextStyle(color: Colors.black,fontSize: 14.0),),
            Divider(color: Colors.grey.shade300),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Email",style: TextStyle(color: Colors.grey.shade400,fontSize: 16.0),),
                IconButton(icon: Icon(Icons.edit), onPressed: (){
                  showDialog(context: context,builder: (context){
                    return UpdateWidget(header: "Update Email",textLabel: "Enter Email",);
                  });
                })]),
      Text("Neha@gmail.com",style: TextStyle(color: Colors.black,fontSize: 14.0),),
              Divider(color: Colors.grey.shade300),
            Text("Birth Date",style: TextStyle(color: Colors.grey.shade400,fontSize: 16.0),),
      Text("10/09/2020",style: TextStyle(color: Colors.black,fontSize: 14.0),),
              Divider(color: Colors.grey.shade300),
              Text("Blood Group",style: TextStyle(color: Colors.grey.shade400,fontSize: 16.0),),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("A+",style: TextStyle(color: Colors.black,fontSize: 14.0),),
                  IconButton(icon: Icon(Icons.edit), onPressed: (){
                    showDialog(context: context,builder: (context){
                      return UpdateWidget(header: "Update Blood Group",textLabel: "Enter Blood Group",);
                    });
                  })]),
              Divider(color: Colors.grey.shade300),
              Text("Address",style: TextStyle(color: Colors.grey.shade400,fontSize: 16.0),),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Mumbai",style: TextStyle(color: Colors.black,fontSize: 14.0),),
                  IconButton(icon: Icon(Icons.edit), onPressed: (){
                    showDialog(context: context,builder: (context){
                      return UpdateWidget(header: "Update Address",textLabel: "Enter Address",);
                    });
                  })]),
              Expanded(
                child:SizedBox())

          ],
          ),
        ),
      ),
    );
  }
}

class UpdateWidget extends StatelessWidget {
  final String header, textLabel;
  UpdateWidget({this.header,this.textLabel,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(header),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      content: TextFormField(
        decoration: InputDecoration(
            labelText: textLabel
        ),
      ),
      actions: [
        RaisedButton(onPressed: (){
          Navigator.pop(context);
        },color:Colors.blue,

          child: Center(child: Text("Ok", style: TextStyle(color: Colors.white,fontSize: 14.0),),),)
      ],
    );
  }
}
