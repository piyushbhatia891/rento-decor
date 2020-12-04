import 'package:eazy_shop/bloc/search_bloc.dart';
import 'package:eazy_shop/cart/index.dart';
import 'package:eazy_shop/models/search/search_model_list.dart';
import 'package:eazy_shop/screens/detail/index.dart';
import 'package:eazy_shop/screens/detail_rental/index.dart';
import 'package:eazy_shop/utils/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../detail/index.dart';

class SearchRentalPage extends StatefulWidget {
  final String categoryId, subCategoryId, pageTitle;
  SearchRentalPage(
      {this.categoryId = "0", this.subCategoryId = "0", this.pageTitle});
  SearchRentalPageState createState() => SearchRentalPageState();
}

class SearchRentalPageState extends State<SearchRentalPage> {
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    if (widget.subCategoryId == "0")
      searchBloc.getProductsByCategoryId(widget.categoryId, false);
    else
      searchBloc.getProductsBySubCategoryId(widget.subCategoryId, true);
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size(double.infinity, MediaQuery.of(context).size.height * 0.08),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [HexColor("#2EB2F2"), HexColor("#2361AE")],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.navigate_before,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Text(widget.pageTitle,
                      style: GoogleFonts.montserrat(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                  Expanded(child: SizedBox()),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemBuilder: (context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Chip(
                        backgroundColor: Colors.white,
                        shape: StadiumBorder(
                            side: BorderSide(color: Color(0xFF0E96D9))),
                        //padding: const EdgeInsets.all(10.0),

                        label: Text("Plastic Chair",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700))),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            Expanded(
              child: StreamBuilder<SearchList>(
                  stream: searchBloc.searchList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.data.length == 0)
                        return Center(child: Text("No Products Found"));
                      return GridView.builder(
                          itemCount: snapshot.data.data.length,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.67,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 5,
                          ),
                          itemBuilder: (context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => ProductRentalPage(
                                            id: snapshot.data.data[index].id)));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: Container(

                                            //height: MediaQuery.of(context).size.height*0.2,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Image.network(
                                              "${snapshot.data.data[index].img1}",
                                              fit: BoxFit.fill,
                                            ))),
                                    Text(
                                      snapshot.data.data[index].name,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          "assets/rupee_sign.jpg",
                                          width: 10.0,
                                          height: 10.0,
                                        ),
                                        Expanded(
                                            child: Text(
                                          snapshot.data.data[index].price,
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        IconButton(
                                            icon: Icon(
                                              Icons.shopping_cart,
                                              color: Colors.blue,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (ctx) =>
                                                          CartPage()));
                                            })
                                      ],
                                    )
                                  ],
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                margin: const EdgeInsets.only(bottom: 20.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black54,
                                          blurRadius: 15.0,
                                          offset: Offset(0.0, 0.75))
                                    ]),
                              ),
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Text("error");
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
