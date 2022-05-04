import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simplifi/app/data/constant/controller_constant.dart';
import 'package:simplifi/app/routes/app_pages.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.7,
        title: Text(
          'Users',
          style: GoogleFonts.montserrat(
            fontSize: Get.width * 0.06,
            color: Colors.black54,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 0.5,
                color: Colors.black54,
              ),
            );
          } else {
            if (controller.userList.isEmpty) {
              return Center(
                child: Text(
                  "User List is empty",
                  style: GoogleFonts.montserrat(
                    fontSize: Get.width * 0.04,
                    color: Colors.black54,
                    letterSpacing: 1,
                  ),
                ),
              );
            } else {
              return Stack(
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    itemBuilder: (context, index) {
                      final userItem = controller.userList[index];
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: Get.height * 0.12,
                          decoration: const BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: Get.width * 0.55,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userItem.name.toString(),
                                      style: GoogleFonts.montserrat(
                                        fontSize: Get.width * 0.04,
                                        color: Colors.black,
                                        letterSpacing: 0.2,
                                      ),
                                    ),
                                    Text(
                                      userItem.email.toString(),
                                      style: GoogleFonts.montserrat(
                                        fontSize: Get.width * 0.03,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Text(
                                      userItem.address!.street.toString() +
                                          " " +
                                          userItem.address!.suite.toString() +
                                          " " +
                                          userItem.address!.city.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        fontSize: Get.width * 0.03,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.35,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        postController.getUserPostList(
                                            userItem.id.toString());
                                        Get.toNamed(Routes.POST);
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.post_add,
                                          size: Get.width * 0.09,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        albumController.getUserAlbumList(
                                            userItem.id.toString());
                                        Get.toNamed(Routes.ALBUM);
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.photo_album,
                                          size: Get.width * 0.09,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        todoController.getUserTodoList(
                                            userItem.id.toString());
                                        Get.toNamed(Routes.TODO);
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.task,
                                          size: Get.width * 0.09,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: controller.userList.length,
                  ),
                ],
              );
            }
          }
        },
      ),
    );
  }
}
