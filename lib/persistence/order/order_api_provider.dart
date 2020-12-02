import 'dart:convert';

import 'package:eazy_shop/models/cat/cat_list.dart';
import 'package:eazy_shop/models/order/orders_list.dart';
import 'package:eazy_shop/models/search/search_model_list.dart';
import 'package:eazy_shop/models/subCat/sub_cat_list.dart';
import 'package:http/http.dart';

class OrderApiProvider {
  Client client = Client();

  //This is the London weather API url available at this link: https://openweathermap.org/current
  final String baseUrl_OrdersApi =
      "http://yontechsoftwares.com/share/swastik/index.php/Api/getorderByUserId";
  Future<Orders> getOrders(String userId) async {
    final response = await client.post(baseUrl_OrdersApi,
        body: jsonEncode(<String, String>{
          "userId": userId,
          'apiVersion': '1.0',
          'token': ''
        })); // Make the network call asynchronously to fetch the London weather data.
    print(response.body.toString());

    if (response.statusCode == 200) {
      return Orders.fromJson(
          jsonDecode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
