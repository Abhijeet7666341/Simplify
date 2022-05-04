import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simplifi/app/modules/album/views/photo_view.dart';
import 'package:simplifi/app/routes/app_pages.dart';

import '../controllers/album_controller.dart';

class AlbumView extends GetView<AlbumController> {
  const AlbumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        elevation: 0.7,
        title: Text(
          'Albums',
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
            if (controller.userAlbumList.isEmpty) {
              return Center(
                child: Text(
                  "Todo List is empty",
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
                      final albumItem = controller.userAlbumList[index];
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListTile(
                          onTap: () {
                            controller.getAlbumPhotos(albumItem.id.toString());
                            Get.to(const PhotoView());
                          },
                          title: Text(
                            albumItem.id.toString(),
                            style: GoogleFonts.montserrat(
                              fontSize: Get.width * 0.035,
                              color: Colors.black54,
                            ),
                          ),
                          subtitle: Text(
                            albumItem.title.toString(),
                            style: GoogleFonts.montserrat(
                              fontSize: Get.width * 0.035,
                              color: Colors.black54,
                            ),
                          ),
                          trailing: const Icon(Icons.forward),
                        ),
                      );
                    },
                    itemCount: controller.userAlbumList.length,
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
