import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:qurb/models/user_model.dart';

import '../constant.dart';
import '../models/response_model.dart';

class GetQuestionsApi {
  Future<ResponseModel> callAPI({required Map<String, String> user}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.wifi) {
      return ResponseModel.noInternet();
    }
    try {
      final Uri url;
      if (user['gender'] == 0.toString()) {
        url = Uri.parse(
            '${Constant.apiPath}?cmd=get_questions&question_type=male_questions');
      } else {
        url = Uri.parse(
            '${Constant.apiPath}?cmd=get_questions&question_type=female_questions');
      }
      final response = await http.post(
        url,
        body: user,
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
