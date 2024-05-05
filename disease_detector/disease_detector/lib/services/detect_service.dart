import 'dart:convert';

import 'package:disease_detector/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DetectService {
  String uri = "http://192.168.1.72:8000/api/predict-tumor";

  Future<List<dynamic>> detectDisease({
    required BuildContext context,
    required String imageUrl,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"image_url": imageUrl}),
      );
      print("The status code is ${res.statusCode}");
      if (res.statusCode == 200) {
        if (jsonDecode(res.body)['result'] == "Pituitary Tumor" ||
            jsonDecode(res.body)['result'] == "Meningioma Tumor" ||
            jsonDecode(res.body)['result'] == "Glioma Tumor") {
          return [
            true,
            jsonDecode(res.body)['result'],
            jsonDecode(res.body)['tumor_probability'],
          ];
        } else {
          return [
            true,
            jsonDecode(res.body)['result'],
            jsonDecode(res.body)['tumor_probability'],
          ];
        }
      } else {
        if (!context.mounted) return [false];
        showSnackBar(context, "Please enter a valid image");
        return [false];
      }
    } catch (e) {
      if (!context.mounted) return [false];
      print(e.toString());
      showSnackBar(context, e.toString());
      return [false];
    }
  }
}
