import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_task/constants/constants.dart';

mixin ApiService on GetxController {
  var client = http.Client();

  Future httpGet(
      {String query = '', String filters = '', String random_url = ''}) async {
    var requestUri =
        Uri.parse('${CONSTANT.SEARCH_URL}&q=$query&$filters&$random_url');

    var response =
        await client.get(requestUri, headers: {'Accept-Encoding': 'gzip'});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    return {'error': response.body};
  }
}
