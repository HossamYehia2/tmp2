import 'ScreenUtils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class ApiLibrary {
  Future<List<dynamic>> sendGetRequest(
      String url, String route, Map<String, dynamic> queryParams) async {
    final uri = Uri.http(url, route, queryParams);
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonBody =
          Map<String, dynamic>.from(json.decode(response.body));
      var x = jsonBody.values.last;
      return x;
    } else if(response.statusCode == 502) {
      throw Exception('Codeforces is down');
    } else {
      throw Exception('Failed to fetch user info.');
    }
  }

  void handleEX(ex, context) {
    if (ex.toString() == 'Exception: Codeforces is down') {
      ScreenUtils().showErrorMessageAndExit(
          context, "Codeforces is down, Please try again later.");
    } else {
      ScreenUtils().showErrorMessageAndExit(
            context, "Issue while fetching your info.");
    }
  }
}
