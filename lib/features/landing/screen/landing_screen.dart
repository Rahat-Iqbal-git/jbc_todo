import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_jbc/common/get_screen_height_width.dart';
import 'package:todo_jbc/common/widgets/horizontal_space.dart';
import 'package:todo_jbc/common/widgets/vertical_space.dart';
import 'package:todo_jbc/features/landing/widgets/add_todo_dialog.dart';
import 'package:todo_jbc/features/search/search_screen.dart';
import 'package:todo_jbc/utils/app_colors.dart';

import '../widgets/todo_list_widget.dart';

class LandingScren extends StatefulWidget {
  const LandingScren({super.key});

  @override
  State<LandingScren> createState() => _LandingScrenState();
}

class _LandingScrenState extends State<LandingScren> {
  TextEditingController todoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                return showTodoDialog(context, todoController, _formKey);
              });
        },
        label: const Text("Add Task"),
        backgroundColor: themeColor,
        icon: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            VerticalSpace(height: getHeight(context) * 2.5),
            // const GreetingsWidget(),
            InkWell(
              onTap: () {
                Get.to(() => SearchScreen());
              },
              child: Container(
                padding: EdgeInsets.all(getHeight(context) * 2),
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
      ),
    );
  }
}
