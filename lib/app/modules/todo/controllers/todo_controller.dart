import 'dart:developer';

import 'package:get/get.dart';
import 'package:simplifi/app/modules/todo/model/todo.dart';
import 'package:simplifi/app/modules/todo/service/todo_service.dart';

class TodoController extends GetxController {
  static TodoController instance = Get.find();

  var isLoading = false.obs;

  void isLoadingTrue() {
    isLoading(true);
  }

  void isLoadingFalse() {
    isLoading(false);
  }

  final userTodoList = List<Todo>.empty(growable: true).obs;

  void getUserTodoList(String id) async {
    isLoadingTrue();
    try {
      var userTodoListApi = await TodoService.getUserTodoList(id);
      log(userTodoListApi.toString());
      if (userTodoListApi.isNotEmpty) {
        userTodoList.value = userTodoListApi;
      }
    } finally {
      isLoadingFalse();
    }
  }
}
