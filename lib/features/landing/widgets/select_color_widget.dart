import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_jbc/common/get_screen_height_width.dart';
import 'package:todo_jbc/features/landing/controller/todo_controller.dart';
import 'package:todo_jbc/utils/app_colors.dart';

class SelectColorWidget extends StatelessWidget {
  SelectColorWidget({
    Key? key,
  }) : super(key: key);

  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(context) * 10,
      width: getWidth(context) * 60,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _selectColorWidget(themeColor.withOpacity(0.4), 1),
          _selectColorWidget(Colors.green.shade200, 2),
          _selectColorWidget(Colors.blue.shade200, 3),
          _selectColorWidget(const Color.fromARGB(255, 248, 199, 153), 4),
        ],
      ),
    );
  }

  Widget _selectColorWidget(Color color, int value) {
    return InkWell(
      onTap: () {
        todoController.setSelectedColor(value);
      },
      child: Obx(() {
        return Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: todoController.selectedColor.value == value
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : Container(),
        );
      }),
    );
  }
}
