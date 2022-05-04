import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/todo_controller.dart';

class TodoView extends GetView<TodoController> {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        elevation: 0.7,
        title: Text(
          'Todo',
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
            if (controller.userTodoList.isEmpty) {
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
                      final todoItem = controller.userTodoList[index];
                      bool? isCompleted = todoItem.completed;
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListTile(
                          tileColor: (isCompleted ?? false)
                              ? Colors.green
                              : Colors.grey,
                          title: Text(
                            todoItem.id.toString(),
                            style: GoogleFonts.montserrat(
                              fontSize: Get.width * 0.035,
                              color: Colors.black54,
                            ),
                          ),
                          subtitle: Text(
                            todoItem.title.toString(),
                            style: GoogleFonts.montserrat(
                              fontSize: Get.width * 0.035,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: controller.userTodoList.length,
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
