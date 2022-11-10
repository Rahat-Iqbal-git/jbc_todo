import 'package:get/get.dart';

class TodoController extends GetxController {
  var selectedColor = 1.obs;
  var isComplete = false.obs;
  // var color = Colors.green.obs;

  setSelectedColor(int value) async {
    selectedColor.value = value;
  }

  setIsComplete(bool value) {
    isComplete.value = value;
  }
}
