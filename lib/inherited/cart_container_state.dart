import 'package:eazy_shop/bloc/product_bloc.dart';
import 'package:eazy_shop/inherited/cart_container.dart';
import 'package:eazy_shop/inherited/cart_inherited.dart';
import 'package:eazy_shop/models/cart/cart_model.dart';
import 'package:eazy_shop/models/cart/cart_product_model.dart';
import 'package:eazy_shop/models/product/product_list.dart';
import 'package:eazy_shop/services/sqflite/database_helper.dart';
import 'package:flutter/material.dart';

class CartContainerState extends State<CartContainer> {
  double subTotal = 0.0;
  Map<int, CartProductModel> cartModel = {};
  int count = 0;
  List<CartsModel> rowList = [];
  bool isinit = true;

  bool isLoading = true;
  void initState() {
    super.initState();
    _getCartItems();
  }

  Future _getCartItems() async {
    count = await DatabaseHelper.instance.getCount();
    rowList = await DatabaseHelper.instance.getcartItems();
    if (isinit) {
      for (CartsModel element in rowList) {
        Products product = await productBloc.fetchProduct(element.id);
        cartModel.putIfAbsent(
            element.id, () => CartProductModel(product.data[0], element));
      }
      subTotal = calculateSubTotal();
    }
    setState(() {
      isinit = false;
      isLoading = false;
    });
  }

  Future updateCartPricing(int productId, int quantity) async {
    await DatabaseHelper.instance.updateCartitem(
        {DatabaseHelper.id: productId, DatabaseHelper.quantity: quantity});
    setState(() {
      CartsModel model = cartModel[productId].model;
      model.quantity = quantity;
      if (quantity == 0) cartModel.remove(productId);

      subTotal = calculateSubTotal();
    });
  }

  double calculateSubTotal() {
    List<CartProductModel> products = cartModel.values.toList();
    double totalCost = 0.0;
    for (int i = 0; i < products.length; i++) {
      double total = double.parse(products[i].product.price);
      int qty = products[i].model.quantity;
      double productCost = total * qty;
      totalCost += productCost;
    }
    return totalCost;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: Text("Loading"))
        : CartInheritedWidget(state: this, child: widget.child);
  }
}
