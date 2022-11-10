import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_jbc/common/get_screen_height_width.dart';
import 'package:todo_jbc/common/widgets/horizontal_space.dart';
import 'package:todo_jbc/common/widgets/vertical_space.dart';
import 'package:todo_jbc/features/landing/widgets/add_todo_dialog.dart';
import 'package:todo_jbc/utils/app_colors.dart';

import '../widgets/todo_list_widget.dart';

class LandingScren extends StatelessWidget {
  const LandingScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "JBC Todo",
          style: GoogleFonts.lato(
              textStyle: const TextStyle(
            color: themeColor,
          )),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return showTodoDialog(context);
              });
        },
        label: const Text("Add Task"),
        backgroundColor: themeColor,
        icon: const Icon(Icons.add),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          VerticalSpace(height: getHeight(context) * 2),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade300,
            ),
            child: Row(
              children: const [
                Icon(Icons.search),
                HorizontalSpace(width: 10),
                Text("Search in your todos"),
              ],
            ),
          ),
          const VerticalSpace(height: 30),
          Text(
            "Your Tasks",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
          const VerticalSpace(height: 10),
          //
          const TodoListWidget(),
          //
        ],
      ),
    );
  }
}
