import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_jbc/common/widgets/vertical_space.dart';
import 'package:todo_jbc/features/search/controller/search_controller.dart';
import 'package:todo_jbc/utils/app_colors.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final SearchController searchController = Get.put(SearchController());

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
      body: Obx(() {
        return ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            TextField(
              controller: searchController.searchKeyTextField.value,
              onChanged: (value) {
                // searchController.searchKey.value = value;
              },
            ),
            const VerticalSpace(height: 10),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("todos")
                    .where('searchKeys', arrayContains: "this")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  log("searchdata ${snapshot.data?.docs.length}");
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: snapshot.data?.docs.length ?? 0,
                        itemBuilder: (context, index) {
                          final temp = snapshot.data?.docs[index];
                          return ListTile(
                            title: Text(temp!['title']),
                          );
                        });
                  } else {
                    return const LinearProgressIndicator();
                  }
                })
          ],
        );
      }),
    );
  }
}
