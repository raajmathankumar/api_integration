import 'package:api_integration/constants/Constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'login_model.dart';


class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
//paas:  83r5^_
  // username: mor_2314
final response=await http.post(Uri.parse(Constants.FAKE_API),body: requestModel.toJson());
    //final response = await http.post(url, body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
