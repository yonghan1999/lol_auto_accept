import 'package:flutter/cupertino.dart';

class SlideItem {
  IconData? icon;
  String title;
  Widget mainView;

  SlideItem({required this.title, required this.mainView, this.icon});
}
