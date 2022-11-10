import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_jbc/common/get_screen_height_width.dart';
import 'package:todo_jbc/common/widgets/vertical_space.dart';
import 'package:todo_jbc/features/landing/controller/select_color_controller.dart';
import 'package:todo_jbc/features/landing/service/add_todo_service.dart';
import 'package:todo_jbc/utils/app_colors.dart';

import 'select_color_widget.dart';
// import 'package:todo_jbc/utils/app_colors.dart';

showTodoDialog(BuildContext context, TextEditingController todoController) {
  final SelectColorController selectColorController =
      Get.put(SelectColorController());
  return AlertDialog(
    contentPadding: EdgeInsets.zero,
    title: const Center(child: Text('Add a todo')),
    content: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalSpace(height: 10),
            Text(
              "Todo title",
              style: TextStyle(
                color: themeColor.withOpacity(0.8),
              ),
            ),
            const VerticalSpace(height: 5),
            TextFormField(
              controller: todoController,
              decoration: const InputDecoration(
                hintText: "Title",
              ),
            ),
            VerticalSpace(height: getHeight(context) * 4),
            const Text("Select a color"),
            const VerticalSpace(height: 10),
            //
            SelectColorWidget(),
          ],
        ),
      ),
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'Cancel',
          style: TextStyle(
            color: Colors.grey.shade800,
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          AddTodoService().addTodo(
              colorValue: selectColorController.selectedColor.value,
              title: todoController.text,
              context: context);
        },
        child: const Text('Add'),
      ),
    ],
  );
}
