import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simplifi/app/modules/album/controllers/album_controller.dart';

class PhotoView extends GetView<AlbumController> {
  const PhotoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        elevation: 0.7,
        title: Text(
          'Photos',
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
            if (controller.albumPhotoList.isEmpty) {
              return Center(
                child: Text(
                  "Album Photo List is empty",
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
                  GridView.builder(
                    itemCount: controller.albumPhotoList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      final photoItem = controller.albumPhotoList[index];
                      return Card(
                        child: GridTile(
                          // footer: Text(photoItem.title.toString()),
                          child: Image.network(photoItem.url.toString()),
                        ),
                      );
                    },
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
