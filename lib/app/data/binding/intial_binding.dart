import 'package:get/get.dart';
import 'package:simplifi/app/modules/album/controllers/album_controller.dart';
import 'package:simplifi/app/modules/post/controllers/post_controller.dart';
import 'package:simplifi/app/modules/todo/controllers/todo_controller.dart';
import 'package:simplifi/app/modules/user/controllers/user_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
    Get.put(PostController());
    Get.put(AlbumController());
    Get.put(TodoController());
  }
}
