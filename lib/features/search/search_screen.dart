import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_jbc/common/get_screen_height_width.dart';
import 'package:todo_jbc/common/widgets/vertical_space.dart';
import 'package:todo_jbc/features/search/controller/search_controller.dart';
import 'package:todo_jbc/utils/app_colors.dart';

import '../todo_details/todo_details_screen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final SearchController searchController = Get.put(SearchController());

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
      body: Obx(() {
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 4),
          shrinkWrap: true,
          primary: false,
          children: [
            VerticalSpace(height: getHeight(context) * 4),
            TextField(
              controller: searchController.searchKeyTextField.value,
              decoration: const InputDecoration(
                hintText: "Search for todos here",
              ),
            ),
            VerticalSpace(height: getHeight(context) * 2),
            Align(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  SizedBox(
                    width: getWidth(context) * 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        searchController.getSearchResult();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: themeColor.withOpacity(0.7),
                          elevation: 0,
                          shape: const StadiumBorder()),
                      icon: const Icon(Icons.search),
                      label: const Text("Search"),
                    ),
                  ),
                ],
              ),
            ),
            searchController.searchResponse.length > 0
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VerticalSpace(height: getHeight(context) * 4),
                      const Text(
                        "Search Result",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const Divider(),
                    ],
                  )
                : Container(),
            const VerticalSpace(height: 10),
            Obx(() {
              return ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemCount: searchController.searchResponse.length,
                itemBuilder: (context, index) {
                  final temp = searchController.searchResponse[index];
                  log(temp.toString());
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: todoListColors[temp['color'] - 1],
                    ),
                    child: ListTile(
                      onTap: () {
                        Get.to(() => TodoDetailsScreen(
                              todoData: temp,
                            ));
                      },
                      leading: temp['isDone'] == true
                          ? Icon(
                              Icons.check_box,
                              color: todoListColors[temp['color'] - 1]
                                  .withGreen(500),
                              // color: Colors.black,
                            )
                          : null,
                      minLeadingWidth: 30,
                      title: Text(
                        "${temp['title']}",
                        style: TextStyle(
                          decoration: temp['isDone'] == true
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const VerticalSpace(height: 10);
                },
              );
            }),
          ],
        );
      }),
    );
  }
}
