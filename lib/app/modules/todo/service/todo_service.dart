import 'dart:convert';
import 'dart:io';

import 'package:simplifi/app/data/constant/url_constant.dart';
import 'package:simplifi/app/modules/todo/model/todo.dart';

class TodoService {
  static Future<List<Todo>> getUserTodoList(String userId) async {
    String url = BASEURL + USER + "/$userId" + TODO;
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.add('Content-type', 'application/json');
    HttpClientResponse response = await request.close();
    httpClient.close();
    var respData = await response.transform(utf8.decoder).join();
    if (response.statusCode == 200) {
      return todoFromJson(respData);
    } else {
      return <Todo>[];
    }
  }
}
