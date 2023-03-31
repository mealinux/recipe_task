import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_task/constants/constants.dart';

class ApiService extends GetxController {
  var client = http.Client();

  Future get({String query = ''}) async {
    var requestUri = Uri.parse('${CONSTANT.SEARCH_URL}&q=$query');

    var response =
        await client.get(requestUri, headers: {'Accept-Encoding': 'gzip'});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    return {'error': response.body};
  }
}
