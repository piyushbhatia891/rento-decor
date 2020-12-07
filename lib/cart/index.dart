import 'package:eazy_shop/cart/widgets/cart_products_list.dart';
import 'package:eazy_shop/cart/widgets/sub_total_widget.dart';
import 'package:eazy_shop/cart_address/index.dart';
import 'package:eazy_shop/inherited/cart_container.dart';
import 'package:eazy_shop/inherited/cart_container_state.dart';
import 'package:eazy_shop/utils/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatefulWidget {
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartContainer(
        child: SafeArea(
          child: Scaffold(
            bottomNavigationBar: BottomWidget(),
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size(
                  double.infinity, MediaQuery.of(context).size.height * 0.08),
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
                      Text("Cart",
                          style: GoogleFonts.montserrat(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                      Expanded(child: SizedBox()),
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
            body: CartProductsList(),
          ),
        ),
      ),
    );
  }
}

class BottomWidget extends StatefulWidget {
  BottomWidget({
    Key key,
  }) : super(key: key);
  BottomWidgetState createState() => BottomWidgetState();
}

class BottomWidgetState extends State<BottomWidget> {
  CartContainerState state;
  void didChangeDependencies() {
    super.didChangeDependencies();
    state = CartContainer.of(context);
  }

  @override
  Widget build(BuildContext context) {
    state = CartContainer.of(context);
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => CartAddressPage(
                          cartPrice: state.subTotal,
                        )));
          },
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [HexColor("#0E96D9"), HexColor("#2273BB")])),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Total Paid",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    SubTotalWidget()
                  ],
                ),
                Container(
                  width: 2.0,
                  decoration: BoxDecoration(color: Colors.white),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Checkout",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
