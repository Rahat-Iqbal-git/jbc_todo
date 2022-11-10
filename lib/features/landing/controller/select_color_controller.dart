import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectColorController extends GetxController {
  var selectedColor = 1.obs;
  var color = Colors.green.obs;

  setSelectedColor(int value) async {
    selectedColor.value = value;
  }
}
