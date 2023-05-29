import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:qurb/models/user_model.dart';

import '../constant.dart';
import '../models/response_model.dart';

class SubmitAnswerApi {
  Future<ResponseModel> callAPI({required Map user}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.wifi) {
      return ResponseModel.noInternet();
    }
    try {
      final Uri url;
      if (user['gender'] == 0.toString()) {
        url = Uri.parse(
            '${Constant.apiPath}?cmd=submit_answer&question_type=male_answers');
      } else {
        url = Uri.parse(
            '${Constant.apiPath}?cmd=submit_answer&question_type=female_answers');
      }
      // print(jsonEncode(user));
      final response = await http.post(
        url,
        body: jsonEncode(user),
        headers: {'Content-Type': 'application/json'},
      );
      return ResponseModel.fromMap(json.decode(response.body));
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
