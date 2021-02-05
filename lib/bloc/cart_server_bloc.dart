import 'package:eazy_shop/models/cart/cart_init_paytm.dart';
import 'package:eazy_shop/models/cart/cart_server_order.dart';
import 'package:eazy_shop/models/cart/cart_server_response.dart';
import 'package:eazy_shop/models/cat/cat_list.dart';
import 'package:eazy_shop/models/subCat/sub_cat.dart';
import 'package:eazy_shop/models/subCat/sub_cat_list.dart';
import 'package:eazy_shop/persistence/cart/cart_repository.dart';
import 'package:eazy_shop/persistence/paytm/paytm_repository.dart';
import 'package:eazy_shop/persistence/repository.dart';
import 'package:rxdart/rxdart.dart';

class CartServerBloc {
  CartRepository _repository = CartRepository();
  PaytmRepository _paytmRepository = PaytmRepository();
  Future<CartServerResponse> createOrder(CartServerModel model) async {
    CartServerResponse checkSum = await _repository.createOrder(model);
    return checkSum;
  }

  Future<Map<dynamic, dynamic>> callPaytm(
      CartServerModel model, CartServerResponse checkSum) async {
    return await _paytmRepository.callPaytm(model, checkSum);
  }

  /*Future<CartInitResponse> callInitPaytm(
      CartServerModel model, CartServerResponse checkSum) async {
    return await _paytmRepository.initiateTransactionWithPaytm(model, checkSum);
  }*/
}

final cartServerBloc = CartServerBloc();
