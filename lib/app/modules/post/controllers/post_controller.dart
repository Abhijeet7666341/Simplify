import 'dart:developer';

import 'package:get/get.dart';
import 'package:simplifi/app/modules/post/model/comment.dart';
import 'package:simplifi/app/modules/post/model/post.dart';
import 'package:simplifi/app/modules/post/service/post_service.dart';

class PostController extends GetxController {
  static PostController instance = Get.find();

  var isLoading = false.obs;

  void isLoadingTrue() {
    isLoading(true);
  }

  void isLoadingFalse() {
    isLoading(false);
  }

  final userPostList = List<Post>.empty(growable: true).obs;

  void getUserPostList(String id) async {
    isLoadingTrue();
    try {
      var userPostListApi = await PostService.getUserPostList(id);
      log(userPostListApi.toString());
      if (userPostListApi.isNotEmpty) {
        userPostList.value = userPostListApi;
      }
    } finally {
      isLoadingFalse();
    }
  }

  var isCommentLoading = false.obs;

  void isCommentLoadingTrue() {
    isCommentLoading(true);
  }

  void isCommentLoadingFalse() {
    isCommentLoading(false);
  }

  final postCommentList = List<Comment>.empty(growable: true).obs;

  Future getPostCommentList(String id) async {
    isCommentLoadingTrue();
    try {
      // postCommentList.clear();
      var postCommentListApi = await PostService.getPostCommentList(id);
      log(postCommentListApi.toString());
      if (postCommentListApi.isNotEmpty) {
        postCommentList.value = postCommentListApi;
        // postCommentList(postCommentList.take(3).toList());
      }
    } finally {
      isCommentLoadingFalse();
    }
  }

  expansionChanged(String postId) async {
    await getPostCommentList(postId);
  }

  emptyCommentList() {
    postCommentList.clear();
  }
}
