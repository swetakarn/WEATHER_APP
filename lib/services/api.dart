import "package:http/http.dart" as http;
import 'dart:convert';

class Api {
  static Future<dynamic> getRequest(String url) {
    try {
      return http.get(url).then((http.Response response) {
        final res = json.decode(response.body);
        final int statusCode = response.statusCode;
        if (statusCode < 200 || statusCode > 400 || json == null) {
          throw ("Error while fetching data");
        }
        return res;
      });
    } catch (e) {
      return e;
    }
  }
}
