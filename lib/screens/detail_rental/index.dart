import 'package:eazy_shop/bloc/product_bloc.dart';
import 'package:eazy_shop/cart/index.dart';
import 'package:eazy_shop/models/product/product_list.dart';
import 'package:eazy_shop/utils/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ProductRentalPage extends StatefulWidget {
  ProductRentalPageState createState() => ProductRentalPageState();
}

class ProductRentalPageState extends State<ProductRentalPage> {
  Widget build(BuildContext context) {
    productBloc.getProductById("2");
    return SafeArea(
      top: false,
      child: Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.07,
          child: Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => CartPage()));
              },
              child: Container(
                child: Center(
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [HexColor("#2DA3DE"), HexColor("#206AB5")])),
              ),
            ),
          ),
        ),
        body: StreamBuilder<Products>(
            stream: productBloc.categories,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  padding: const EdgeInsets.all(0.0),
                  children: [
                    Stack(children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          "${snapshot.data.data[0].img1}",
                          fit: BoxFit.cover,
                        ),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 15.0,
                                  offset: Offset(0.0, 0.75))
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            )),
                      ),
                      Positioned(
                        top: 30.0,
                        left: 20.0,
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                                child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 20.0,
                            )),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.0)),
                          ),
                        ),
                      )
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data.data[0].name,
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Text(
                                  snapshot.data.data[0].description,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey.shade500),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    "assets/rupee_sign.jpg",
                                    width: 10.0,
                                    height: 10.0,
                                  ),
                                  Text(
                                    snapshot.data.data[0].price,
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0.0, 0.75))
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset("assets/qty.png"),
                                  ),
                                  Text(
                                    "Required Capacity",
                                    style: TextStyle(fontSize: 16.0),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("Update Qunatity"),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          content: TextFormField(
                                            decoration: InputDecoration(
                                                labelText:
                                                    "Enter The Quantity"),
                                          ),
                                          actions: [
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              color: Colors.blue,
                                              child: Center(
                                                child: Text(
                                                  "Ok",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16.0),
                                                ),
                                              ),
                                            )
                                          ],
                                        );
                                      });
                                },
                                child: Text("200"))
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0,
                                        offset: Offset(0.0, 0.75))
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset("assets/barrel.png"),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Start Date",
                                          style: TextStyle(fontSize: 14.0),
                                        ),
                                        Text(
                                          "11 / 10 /2020",
                                          style: TextStyle(fontSize: 14.0),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 1.0)),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0,
                                        offset: Offset(0.0, 0.75))
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset("assets/barrel.png"),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "End Date",
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                        Text(
                                          "11 / 10 /2020",
                                          style: TextStyle(fontSize: 12.0),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "You May Also Like",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 14.0,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: ListView.builder(
                        itemBuilder: (context, int index) {
                          return InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                        content: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.3,
                                            child: PhotoViewGallery.builder(
                                              scrollPhysics:
                                                  const BouncingScrollPhysics(),
                                              builder: (BuildContext context,
                                                  int index) {
                                                return PhotoViewGalleryPageOptions(
                                                  imageProvider: AssetImage(
                                                      "assets/guitar.jpg"),
                                                  initialScale:
                                                      PhotoViewComputedScale
                                                          .contained,
                                                  maxScale:
                                                      PhotoViewComputedScale
                                                          .covered,
                                                  heroAttributes:
                                                      PhotoViewHeroAttributes(
                                                          tag: index),
                                                );
                                              },
                                              itemCount: 5,
                                              scrollDirection: Axis.horizontal,
                                            )));
                                  },
                                  barrierDismissible: true);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10.0),
                              width: MediaQuery.of(context).size.width * 0.2,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/guitar.jpg")),
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                      child: Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("Error"));
              }
              return Center(child: Text("Error"));
            }),
      ),
    );
  }
}
