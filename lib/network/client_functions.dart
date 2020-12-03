import 'dart:convert';

import 'package:eazy_shop/models/login/send_otp.dart';
import 'package:eazy_shop/models/login/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String _baseUrl =
    "http://yontechsoftwares.com/share/swastik/index.php/Api/sendOtp";
Future<SendOtpModel> getOtp(String number) async {
  http.Client client = http.Client();
  final http.Response response = await client.post(
    _baseUrl,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'mobile': number,
      'userType': 'Customer',
      'apiVersion': '1.0'
    }),
  );

  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("mobile", number);
    return SendOtpModel.fromJson(parsed);
  } else {
    throw Exception('Failed to Get Otp.');
  }
}

Future<UserModel> verifyOtp(int mobile, String otp) async {
  http.Client client = http.Client();
  final http.Response response = await client.post(
    "http://yontechsoftwares.com/share/swastik/index.php/Api/verifyOtp",
    /*headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },*/
    body: jsonEncode(<String, dynamic>{
      'mobile': mobile,
      'userType': 'Customer',
      'otp': otp
    }),
  );

  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body);

    return UserModel.fromJson(parsed);
  } else {
    throw Exception('Failed to Get Otp.');
  }
}
