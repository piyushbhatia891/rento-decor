import 'dart:convert';

import 'package:eazy_shop/models/login/send_otp.dart';
import 'package:http/http.dart' as http;

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

    return SendOtpModel.fromJson(parsed);
  } else {
    throw Exception('Failed to Get Otp.');
  }
}

Future<SendOtpModel> verifyOtp(String otp, String mobile) async {
  http.Client client = http.Client();
  final http.Response response = await client.post(
    "http://yontechsoftwares.com/share/swastik/index.php/Api/verifyOtp",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'mobile': mobile,
      'otp': '1111',
      'userType': 'Customer',
      'apiVersion': '1.0'
    }),
  );

  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body);

    return SendOtpModel.fromJson(parsed);
  } else {
    throw Exception('Failed to Get Otp.');
  }
}
