import 'package:flutter/cupertino.dart';

class SlideItem {
  IconData? icon;
  String title;
  Widget mainView;

  SlideItem(this.title, this.mainView, {this.icon});
}
