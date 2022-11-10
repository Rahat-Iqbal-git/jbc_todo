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

    await reference.add({
      "title": title,
      "color": colorValue,
      "isDone": false,
    }).then((value) {
      Navigator.pop(context);
      log("todo added");
    });
  }
}
