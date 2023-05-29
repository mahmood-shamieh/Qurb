import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';
import '../models/response_model.dart';

class SignInApi {
  Future<ResponseModel> callAPI({required Map<String, dynamic> user}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.wifi) {
      return ResponseModel.noInternet();
    }
    try {
      final url = Uri.parse('${Constant.apiPath}?route=public&cmd=login');

      final response = await http.post(
        url,
        body: jsonEncode(user),
        headers: {'Content-Type': 'application/json'},
      );
      return ResponseModel.fromMap(jsonDecode(response.body));
    } catch (e) {
      Get.log('Error: $e');
      Get.log('Error: ${e.runtimeType}');
      if (e.runtimeType.toString() == '_ClientSocketException') {
        return ResponseModel.noInternet();
      }
      return ResponseModel.undefinedProblem();
    }
  }
}
