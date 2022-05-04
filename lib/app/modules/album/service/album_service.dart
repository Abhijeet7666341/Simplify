import 'dart:convert';
import 'dart:io';

import 'package:simplifi/app/data/constant/url_constant.dart';
import 'package:simplifi/app/modules/album/model/album.dart';
import 'package:simplifi/app/modules/album/model/photo.dart';

class AlbumService {
  static Future<List<Album>> getUserAlbumList(String userId) async {
    String url = BASEURL + USER + "/$userId" + ALBUM;
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.add('Content-type', 'application/json');
    HttpClientResponse response = await request.close();
    httpClient.close();
    var respData = await response.transform(utf8.decoder).join();
    if (response.statusCode == 200) {
      return albumFromJson(respData);
    } else {
      return <Album>[];
    }
  }

  static Future<List<Photos>> getAlbumPhotoList(String albumId) async {
    String url = BASEURL + ALBUM + "/$albumId" + PHOTOS;
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.add('Content-type', 'application/json');
    HttpClientResponse response = await request.close();
    httpClient.close();
    var respData = await response.transform(utf8.decoder).join();
    if (response.statusCode == 200) {
      return photosFromJson(respData);
    } else {
      return <Photos>[];
    }
  }
}
