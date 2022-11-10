import 'package:flutter/material.dart';
import 'package:todo_jbc/common/get_screen_height_width.dart';
import 'package:todo_jbc/common/widgets/vertical_space.dart';
import 'package:todo_jbc/utils/app_colors.dart';

class GreetingsWidget extends StatefulWidget {
  const GreetingsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<GreetingsWidget> createState() => _GreetingsWidgetState();
}

class _GreetingsWidgetState extends State<GreetingsWidget> {
  String dayTime = "";
  var data = DateTime.now().hour;

  @override
  void initState() {
    super.initState();
    if (data < 12) {
      dayTime = "morning";
    } else if (data < 18) {
      dayTime = "afternoon";
    } else {
      dayTime = "evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good $dayTime",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w800,
                    fontSize: getHeight(context) * 2.5,
                  ),
                ),
                const VerticalSpace(height: 4),
                Text(
                  "Let's get things done.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w800,
                    fontSize: getHeight(context) * 2.5,
                  ),
                ),
              ],
            ),
            // const Spacer(),
            // Container(
            //   padding: EdgeInsets.all(getHeight(context) * 2.5),
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: themeColor.withOpacity(0.4),
            //   ),
            //   child: Text(
            //     "L",
            //     style: TextStyle(
            //       color: Colors.black87,
            //       fontWeight: FontWeight.w800,
            //       fontSize: getHeight(context) * 2.5,
            //     ),
            //   ),
            // ),
          ],
        ),
        const VerticalSpace(height: 30),
      ],
    );
  }
}
