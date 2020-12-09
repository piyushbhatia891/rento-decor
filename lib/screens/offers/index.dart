import 'package:eazy_shop/models/offers/offers_list.dart';
import 'package:eazy_shop/utils/color/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eazy_shop/bloc/offer_bloc.dart';

class OffersPage extends StatefulWidget {
  OffersPageState createState() => OffersPageState();
}

class OffersPageState extends State<OffersPage> {
  Widget build(BuildContext context) {
    offerBloc.getOffers();
    return StreamBuilder<Offers>(
        stream: offerBloc.categories,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                HexColor("#2EB2F2"),
                                HexColor("#2361AE")
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10.0),
                              right: Radius.circular(10.0))),
                    ),
                    Positioned(
                      left: 20.0,
                      right: 20.0,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(
                                Icons.navigate_before,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                                child: Text("Offers",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600))),
                            Icon(
                              Icons.notification_important_outlined,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.15,
                      left: 20.0,
                      right: 20.0,
                      child: Container(
                        padding: const EdgeInsets.all(30.0),
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Image.network(
                              "${snapshot.data.data[0].image}",
                              fit: BoxFit.cover,
                            )),
                            SizedBox(
                              height: 10.0,
                            ),
                            Html(data: snapshot.data.data[0].description),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              snapshot.data.data[0].title,
                              style: TextStyle(color: HexColor("#FFCC00")),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Min Bill Amount ${snapshot.data.data[0].minBillAmt}",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 24.0,
                                  fontStyle: FontStyle.italic),
                            ),
                            Container(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Click Here",
                                  textAlign: TextAlign.end,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey,
                                  size: 12.0,
                                )
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
          } else if (snapshot.hasError) {
            return Center(child: Text("Error"));
          }
          return Center(child: Text("Loading"));
        });
  }
}
