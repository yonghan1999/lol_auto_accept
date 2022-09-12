import 'package:flutter/material.dart';
import 'package:lol_auto_accept/core/app_export.dart';

class NavigationBodyController extends GetxController {
  ///当前显示标签页面的标识
  int currentSelectIndex = 0;

  ///保存页面的List
  List<Widget> pageList = [];

  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController(
      initialPage: 0,
       ///为true是保持加载的每个页面的状态
      keepPage: true
    );
    super.onInit();
  }

  @override
  InternalFinalCallback<void> get onDelete {
    pageController.dispose();
    return super.onDelete;
  }
}
