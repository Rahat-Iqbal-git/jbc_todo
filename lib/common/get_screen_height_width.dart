import 'package:flutter/cupertino.dart';

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height / 100;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width / 100;
}
