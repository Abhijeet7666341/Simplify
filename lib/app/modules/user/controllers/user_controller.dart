import 'dart:developer';

import 'package:get/get.dart';
import 'package:simplifi/app/modules/user/model/user.dart';
import 'package:simplifi/app/modules/user/service/user_service.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserList();
  }

  var isLoading = false.obs;

  void isLoadingTrue() {
    isLoading(true);
  }

  void isLoadingFalse() {
    isLoading(false);
  }

  final userList = List<User>.empty(growable: true).obs;

  void getUserList() async {
    isLoadingTrue();
    try {
      var userListApi = await UserService.getUserList();
      log(userListApi.toString());
      if (userListApi.isNotEmpty) {
        userList.value = userListApi;
      }
    } finally {
      isLoadingFalse();
    }
  }
}
