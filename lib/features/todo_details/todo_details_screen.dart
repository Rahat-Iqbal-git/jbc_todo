import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:todo_jbc/common/get_screen_height_width.dart';
import 'package:todo_jbc/common/widgets/horizontal_space.dart';
import 'package:todo_jbc/common/widgets/vertical_space.dart';
import 'package:todo_jbc/features/landing/controller/todo_controller.dart';
import 'package:todo_jbc/features/landing/screen/landing_screen.dart';
import 'package:todo_jbc/features/landing/widgets/select_color_widget.dart';
import 'package:todo_jbc/utils/app_colors.dart';

class TodoDetailsScreen extends StatefulWidget {
  const TodoDetailsScreen({required this.todoData, super.key});

  final QueryDocumentSnapshot todoData;

  @override
  State<TodoDetailsScreen> createState() => _TodoDetailsScreenState();
}

class _TodoDetailsScreenState extends State<TodoDetailsScreen> {
  final TextEditingController titleField = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  TodoController todoController = Get.put(TodoController());

  @override
  void initState() {
    super.initState();
    titleField.text = widget.todoData['title'];
    todoController.setSelectedColor(widget.todoData['color']);
    todoController.setIsComplete(widget.todoData['isDone']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details",
            style: TextStyle(
              color: Colors.black87,
            )),
        centerTitle: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black87,
            )),
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 4),
          shrinkWrap: true,
          children: [
            VerticalSpace(height: getHeight(context) * 2),
            const Text(
              "Title",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const VerticalSpace(height: 10),
            TextFormField(
              controller: titleField,
              // maxLines: 3,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Field is empty";
                } else {
                  return null;
                }
              },
            ),
            const VerticalSpace(height: 10),
            Text(
              "Change Color",
              style: TextStyle(
                color: Colors.grey.shade800,
              ),
            ),
            const VerticalSpace(height: 10),
            //
            SelectColorWidget(),
            //
            const VerticalSpace(height: 10),
            Row(
              children: [
                widget.todoData['isDone'] == true
                    ? const Text("Task Completed")
                    : const Text("Task Incomplete"),
                const HorizontalSpace(width: 10),
                Obx(() {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: TextButton.icon(
                      onPressed: () {
                        todoController.isComplete.toggle();
                        log(todoController.isComplete.value.toString());
                      },
                      icon: const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                      label: todoController.isComplete.value == false
                          ? const Text(
                              "Mark as complete",
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            )
                          : const Text(
                              "Mark as incomplete",
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                    ),
                  );
                }),
              ],
            ),
            const VerticalSpace(height: 83),

            SizedBox(
              width: getWidth(context) * 85,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: getWidth(context) * 38,
                    height: getHeight(context) * 4.5,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('todos')
                            .doc(widget.todoData.id)
                            .delete()
                            .then((value) {
                          Get.back();
                        });
                      },
                      style: OutlinedButton.styleFrom(
                          // backgroundColor: themeColor.withOpacity(0.5),
                          foregroundColor: themeColor.withOpacity(0.5),
                          side: BorderSide(color: themeColor.withOpacity(0.45)),
                          elevation: 0,
                          shape: const StadiumBorder()),
                      icon: const Icon(Icons.delete),
                      label: const Text("Delete"),
                    ),
                  ),
                  Container(
                    width: getWidth(context) * 53,
                    height: getHeight(context) * 4.5,
                    padding:
                        EdgeInsets.symmetric(horizontal: getWidth(context) * 4),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          FirebaseFirestore.instance
                              .collection('todos')
                              .doc(widget.todoData.id)
                              .update({
                            'title': titleField.text,
                            'color': todoController.selectedColor.value,
                            'isDone': todoController.isComplete.value,
                            'searchKeys': getSearchKeys(titleField.text),
                          }).then(
                            (value) {
                              Get.offAll(() => const LandingScren());
                              Fluttertoast.showToast(
                                msg: "Todo updated",
                              );
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: themeColor.withOpacity(0.7),
                          elevation: 0,
                          shape: const StadiumBorder()),
                      icon: const Icon(Icons.save),
                      label: const Text("Save"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  getSearchKeys(String name) {
    List<String> searchList = [];
    String temp = "";
    for (int i = 0; i < name.length; i++) {
      temp = temp + name[i].toLowerCase();
      searchList.add(temp);
    }
    return searchList;
  }
}
