import 'dart:convert';
import 'dart:io';

import 'package:simplifi/app/data/constant/url_constant.dart';
import 'package:simplifi/app/modules/user/model/user.dart';

class UserService {
  static Future<List<User>> getUserList() async {
    String url = BASEURL + USER;
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.add('Content-type', 'application/json');
    HttpClientResponse response = await request.close();
    httpClient.close();
    var respData = await response.transform(utf8.decoder).join();
    if (response.statusCode == 200) {
      return userFromJson(respData);
    } else {
      return <User>[];
    }
  }
}
