import 'dart:developer';

import 'package:get/get.dart';
import 'package:simplifi/app/modules/album/model/album.dart';
import 'package:simplifi/app/modules/album/model/photo.dart';
import 'package:simplifi/app/modules/album/service/album_service.dart';

class AlbumController extends GetxController {
  static AlbumController instance = Get.find();

  var isLoading = false.obs;

  void isLoadingTrue() {
    isLoading(true);
  }

  void isLoadingFalse() {
    isLoading(false);
  }

  final userAlbumList = List<Album>.empty(growable: true).obs;

  void getUserAlbumList(String id) async {
    isLoadingTrue();
    try {
      var userAlbumListApi = await AlbumService.getUserAlbumList(id);
      log(userAlbumListApi.toString());
      if (userAlbumListApi.isNotEmpty) {
        userAlbumList.value = userAlbumListApi;
      }
    } finally {
      isLoadingFalse();
    }
  }

  final albumPhotoList = List<Photos>.empty(growable: true).obs;

  Future getAlbumPhotoList(String id) async {
    isLoadingTrue();
    try {
      var albumPhotoListApi = await AlbumService.getAlbumPhotoList(id);
      log(albumPhotoListApi.toString());
      if (albumPhotoListApi.isNotEmpty) {
        albumPhotoList.value = albumPhotoListApi;
      }
    } finally {
      isLoadingFalse();
    }
  }

  getAlbumPhotos(String albumId) async {
    await getAlbumPhotoList(albumId);
  }

  emptyPhotoList() {
    albumPhotoList.clear();
  }
}
