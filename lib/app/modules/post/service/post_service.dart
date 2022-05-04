import 'dart:convert';
import 'dart:io';

import 'package:simplifi/app/data/constant/url_constant.dart';
import 'package:simplifi/app/modules/post/model/comment.dart';
import 'package:simplifi/app/modules/post/model/post.dart';

class PostService {
  static Future<List<Post>> getUserPostList(String userId) async {
    String url = BASEURL + USER + "/$userId" + POST;
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.add('Content-type', 'application/json');
    HttpClientResponse response = await request.close();
    httpClient.close();
    var respData = await response.transform(utf8.decoder).join();
    if (response.statusCode == 200) {
      return postFromJson(respData);
    } else {
      return <Post>[];
    }
  }

  static Future<List<Comment>> getPostCommentList(String postId) async {
    String url = BASEURL + POST + "/$postId" + COMMENT;
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.add('Content-type', 'application/json');
    HttpClientResponse response = await request.close();
    httpClient.close();
    var respData = await response.transform(utf8.decoder).join();
    if (response.statusCode == 200) {
      return commentFromJson(respData);
    } else {
      return <Comment>[];
    }
  }
}
