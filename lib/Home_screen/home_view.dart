import 'package:eazy_shop/bloc/cat_bloc.dart';
import 'package:eazy_shop/bloc/offer_bloc.dart';
import 'package:eazy_shop/models/cat/cat_list.dart';
import 'package:eazy_shop/models/home_data_model.dart';
import 'package:eazy_shop/models/offers/offers_list.dart';
import 'package:eazy_shop/models/subCat/sub_cat_list.dart';
import 'package:eazy_shop/screens/search/search_page.dart';
import 'package:eazy_shop/screens/search_rental/index.dart';
import 'package:eazy_shop/utils/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    var listViewImage =
        'https://www.moredesign.com/wp-content/uploads/2020/03/1-14.jpg';
    catBloc.getCategories();
    catBloc.getSubCategories();
    offerBloc.getOffers();
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    //fit: StackFit.loose,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.30,
                        color: Colors.white,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            gradient: LinearGradient(
                                colors: [
                                  HexColor("#2EB2F2"),
                                  HexColor("#2361AE")
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                      ),
                      _appBar(context),
                      _headerSection(context),
                      _textWidgetBox(context)
                    ],
                  ),
                  ListContainerWidget(),
                  ListContainerWidget2()
                ],
              ),
            )),
      ),
    );
  }

  Positioned _textWidgetBox(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.20,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40.0),
          padding: const EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 2.0,
                    spreadRadius: 2.0)
              ]),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => SearchRentalPage()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Search"), Icon(Icons.search)],
            ),
          ),
        ),
      ),
    );
  }

  Positioned _headerSection(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.08,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CircleAvatar(
                radius: 55.0,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage("assets/face.jpg"),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Hi Neha',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Text(
                      'Good Morning',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Positioned _appBar(BuildContext context) {
    return Positioned(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.arrow_back_ios, color: Colors.white, size: 16.0),
            Text(
              "Eazy Shop",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            Icon(
              Icons.notification_important,
              color: Colors.white,
              size: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}

class ListContainerWidget extends StatelessWidget {
  ListContainerWidget({
    Key key,
  }) : super(key: key);

  List<ServicesModel> model = [
    new ServicesModel(imageUrl: "assets/dinner.png", title: "Party Rental"),
    new ServicesModel(
        imageUrl: "assets/balloon.png", title: "Party Decoration"),
    new ServicesModel(imageUrl: "assets/rhythm.png", title: "Band")
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Browse By Categories",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            Icon(Icons.arrow_forward)
          ]),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          //margin: const EdgeInsets.all(20.0),
          child: StreamBuilder(
              stream: catBloc.categories,
              builder: (context, AsyncSnapshot<Categories> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      reverse: true,
                      itemBuilder: (context, int index) {
                        return InkWell(
                          onTap: () {
                            if (snapshot.data.data[index].type == "0") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => SearchRentalPage(
                                          categoryId:
                                              snapshot.data.data[index].id,
                                          pageTitle: snapshot
                                              .data.data[index].categoryName)));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => SearchPage(
                                          categoryId:
                                              snapshot.data.data[index].id,
                                          pageTitle: snapshot
                                              .data.data[index].categoryName)));
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Image.network(
                                    snapshot.data.data[index].image,
                                    fit: BoxFit.cover,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height:
                                      MediaQuery.of(context).size.width * 0.2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade300,
                                            blurRadius: 2.0,
                                            spreadRadius: 4.0)
                                      ]),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Center(
                                    child: Text(
                                  snapshot.data.data[index].categoryName,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 12.0),
                                ))
                              ],
                            ),
                          ),
                        );
                      },
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.data.length);
                } else {
                  return Text(snapshot.error.toString());
                }
              }),
        )
      ],
    );
  }
}

class ListContainerWidget2 extends StatelessWidget {
  ListContainerWidget2({
    Key key,
  }) : super(key: key);

  List<ServicesModel> model = [
    new ServicesModel(
        imageUrl: "assets/chair.png",
        title: "ArmChair",
        subtitle: "200+ Products"),
    new ServicesModel(
        imageUrl: "assets/sofa.png",
        title: "Sofa Red",
        subtitle: "50+ Products"),
    new ServicesModel(
        imageUrl: "assets/sofa.png",
        title: "Sofa Red",
        subtitle: "80+ Products"),
    new ServicesModel(
        imageUrl: "assets/sofa.png",
        title: "Sofa Red",
        subtitle: "80+ Products")
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Browse By Offers",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
            Icon(Icons.arrow_forward)
          ]),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          height: MediaQuery.of(context).size.height * 0.25,
          child: StreamBuilder<Offers>(
              stream: offerBloc.categories,
              builder: (context, AsyncSnapshot<Offers> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemBuilder: (context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => SearchRentalPage(
                                            subCategoryId:
                                                snapshot.data.data[index].id)));
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 10.0),
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          Image.network(
                                            snapshot.data.data[index].image,
                                            fit: BoxFit.contain,
                                          ),
                                          Text(
                                            snapshot.data.data[index].title,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          Text(
                                            snapshot
                                                .data.data[index].description,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade400,
                                                fontSize: 12.0),
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade300,
                                                blurRadius: 2.0,
                                                spreadRadius: 4.0)
                                          ]),
                                      padding: const EdgeInsets.all(10.0),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.data.length);
                    }
                }
              }),
        )
      ],
    );
  }
}
