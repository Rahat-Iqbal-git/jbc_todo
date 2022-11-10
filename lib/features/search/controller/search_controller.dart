// ignore_for_file: prefer_is_empty

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  var searchKey = "".obs;
  var searchKeyTextField = TextEditingController().obs;

  var searchResponse = <QueryDocumentSnapshot<Map<String, dynamic>>>[].obs;

  // var search

  getSearchResult() async {
    var response = await FirebaseFirestore.instance
        .collection('todos')
        .where(
          'searchKeys',
          arrayContains: searchKeyTextField.value.text.toLowerCase(),
        )
        .get();
    var data = response.docs;
    searchResponse.clear();

    // log(data[0]['title']);
    log(data.length.toString());

    if (data.length != 0) {
      searchResponse.clear();
      searchResponse.addAll(data);
    }
  }
}
