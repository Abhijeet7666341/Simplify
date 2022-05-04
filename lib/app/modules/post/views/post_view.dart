import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/post_controller.dart';

class PostView extends GetView<PostController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        elevation: 0.7,
        title: Text(
          'Posts',
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
            if (controller.userPostList.isEmpty) {
              return Center(
                child: Text(
                  "Post List is empty",
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
                      final postItem = controller.userPostList[index];
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ExpansionTile(
                          title: Text(
                            postItem.title.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                              fontSize: Get.width * 0.04,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          subtitle: Text(
                            postItem.body.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                              fontSize: Get.width * 0.035,
                              color: Colors.black54,
                            ),
                          ),
                          onExpansionChanged: (bool isExpanded) {
                            controller.emptyCommentList();
                            controller.expansionChanged(postItem.id.toString());
                          },
                          children: [
                            Obx(() {
                              if (controller.isCommentLoading.value) {
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 0.5,
                                          color: Colors.grey,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ListTile(
                                      title: Text(
                                        "Loading Comments ...",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                          fontSize: Get.width * 0.03,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return ListView.builder(
                                  itemCount: controller.postCommentList.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    final commentItem =
                                        controller.postCommentList[index];
                                    if (controller.isCommentLoading.value) {
                                      return const Center(
                                        child: CircularProgressIndicator(
                                          strokeWidth: 0.5,
                                          color: Colors.black54,
                                        ),
                                      );
                                    } else {
                                      return Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 0.5,
                                                color: Colors.grey,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: ListTile(
                                            title: Text(
                                              commentItem.name.toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                fontSize: Get.width * 0.03,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            subtitle: Text(
                                              commentItem.body.toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                fontSize: Get.width * 0.03,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                );
                              }
                            }),
                          ],
                        ),
                      );
                    },
                    itemCount: controller.userPostList.length,
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
