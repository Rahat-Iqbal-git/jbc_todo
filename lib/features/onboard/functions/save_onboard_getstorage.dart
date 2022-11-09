import 'package:get_storage/get_storage.dart';

saveOnboardGetstorage() {
  var box = GetStorage();
  box.write("showOnboardScreen", false);
}
