import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AddTodoService {
  addTodo(
      {required int colorValue,
      required String title,
      required BuildContext context}) async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection('todos');

    List<String> searchKeys = getSearchKeys(title);

    await reference.add({
      "title": title,
      "color": colorValue,
      "isDone": false,
      "searchKeys": searchKeys,
    }).then((value) {
      Navigator.pop(context);
      log("todo added");
    });
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
