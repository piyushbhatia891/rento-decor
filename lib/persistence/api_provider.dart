import 'dart:convert';

import 'package:eazy_shop/models/cat/cat_list.dart';
import 'package:eazy_shop/models/subCat/sub_cat_list.dart';
import 'package:http/http.dart';

class ApiProvider {
  Client client = Client();

  //This is the London weather API url available at this link: https://openweathermap.org/current
  final _baseUrl_CategoriesApi =
      "http://yontechsoftwares.com/share/swastik/index.php/Api/allCategories";

  final _baseUrl_SubCategoriesApi =
      "http://yontechsoftwares.com/share/swastik/index.php/Api/getSubCategoryByCategoryId";

  Future<Categories> getCategories() async {
    final response = await client.get(
        "$_baseUrl_CategoriesApi"); // Make the network call asynchronously to fetch the London weather data.
    print(response.body.toString());

    if (response.statusCode == 200) {
      return Categories.fromJson(
          jsonDecode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<SubCategories> getSubCategoriesByCategoryId(String categoryId) async {
    final response = await client.post(
      "$_baseUrl_SubCategoriesApi",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'id': categoryId, 'token': '', 'apiVersion': '1.0'}),
    ); // Make the network call asynchronously to fetch the London weather data.
    print(response.body.toString());

    if (response.statusCode == 200) {
      return SubCategories.fromJson(
          jsonDecode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
