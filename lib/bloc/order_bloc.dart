import 'package:eazy_shop/models/cat/cat_list.dart';
import 'package:eazy_shop/models/order/orders_list.dart';
import 'package:eazy_shop/models/search/search_model_list.dart';
import 'package:eazy_shop/models/subCat/sub_cat_list.dart';
import 'package:eazy_shop/persistence/order/order_repository.dart';
import 'package:eazy_shop/persistence/repository.dart';
import 'package:eazy_shop/persistence/search/search_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../order/index.dart';

class OrderBloc {
  OrderRepository _repository = OrderRepository();

  //Create a PublicSubject object responsible to add the data which is got from
  // the server in the form of WeatherResponse object and pass it to the UI screen as a stream.
  final _searchFetcher = PublishSubject<Orders>();
  Stream<Orders> get searchList => _searchFetcher.stream;

  getOrdersByUserId(String userId) async {
    Orders weatherResponse = await _repository.getOrdersByUserId(userId);
    _searchFetcher.sink.add(weatherResponse);
  }

  dispose() {
    //Close the weather fetcher
    _searchFetcher.close();
  }
}

final orderBloc = OrderBloc();
