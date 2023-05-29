import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:qurb/models/user_model.dart';

import '../constant.dart';
import '../models/response_model.dart';

class UpdateProfileApi {
  Future<ResponseModel> callAPI(
      {required Map<String, String> user, File? file}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.wifi) {
      return ResponseModel.noInternet();
    }
    // print(user);
    // print(file);
    try {
      final url = Uri.parse('${Constant.apiPath}?cmd=update_profile');
      var request = http.MultipartRequest(
        'POST',
        url,
      );
      request.headers.addAll({'Content-Type': 'application/json'});
      request.fields.addAll(user);
      if (file != null) {
        request.files.add(
          await http.MultipartFile.fromPath('img', file.path),
        );
      }
      final response = await request.send();

      return ResponseModel.fromMap(
          json.decode(await response.stream.bytesToString()));
    } catch (e) {
      Get.log('Error: $e');
      Get.log('Error: ${e.runtimeType}');
      String t = e.toString();
      print(t);
      return ResponseModel(
          code: 500, body: {'account': UserModel()}, message: e.toString());
      if (e.runtimeType.toString() == '_ClientSocketException') {
        return ResponseModel.noInternet();
      }
      return ResponseModel.undefinedProblem();
    }
  }
}
