import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:todo_jbc/common/get_screen_height_width.dart';
import 'package:todo_jbc/common/widgets/vertical_space.dart';
import 'package:todo_jbc/features/landing/controller/todo_controller.dart';
import 'package:todo_jbc/features/landing/service/add_todo_service.dart';
import 'package:todo_jbc/utils/app_colors.dart';

import 'select_color_widget.dart';
// import 'package:todo_jbc/utils/app_colors.dart';

showTodoDialog(
  BuildContext context,
  TextEditingController todoController,
  GlobalKey<FormState> formKey,
) {
  final TodoController todo = Get.put(TodoController());
  return Form(
    key: formKey,
    child: AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      contentPadding: EdgeInsets.zero,
      title: const Center(child: Text('Add a todo')),
      content: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getWidth(context) * 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpace(height: 10),
              SizedBox(
                width: getWidth(context) * 85,
              ),
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
                validator: (value) {
                  if (value == null) {
                    return "Add a title";
                  }
                },
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
            if (todoController.text == null || todoController.text.isEmpty) {
              Fluttertoast.showToast(
                msg: "Add a title",
                gravity: ToastGravity.TOP,
              );
              return;
            } else {
              AddTodoService().addTodo(
                  colorValue: todo.selectedColor.value,
                  title: todoController.text,
                  context: context);
              // clears text field value
              todoController.clear();
            }
          },
          child: const Text('Add'),
        ),
      ],
    ),
  );
}
