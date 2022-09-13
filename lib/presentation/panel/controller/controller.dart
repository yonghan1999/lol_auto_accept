import 'package:flutter/material.dart';
import 'package:lol_auto_accept/core/app_export.dart';

import '../model/slide_item.dart';
import '../views/view_export.dart';

class PanelController extends GetxController {
  List<SlideItem> slideItems = List.from([
    SlideItem(title: "common_settings".tr, mainView: CommonSetting("page1"), icon: Icons.settings),
    SlideItem(title: "webcaster_settings".tr, mainView: CommonSetting("page3"), icon: Icons.face),
    SlideItem(title: "about".tr, mainView: CommonSetting("page4"), icon: Icons.info_outline),
  ]);

  late final PageController pageController;

  ///当前显示标签页面的标识
  int currentSelectIndex = 0;

  List<Widget> slideList = [];

  ///保存页面的List
  List<Widget> pageList = [];

  @override
  void onInit() {
    pageController = PageController(
        initialPage: 0,

        ///为true是保持加载的每个页面的状态
        keepPage: true);
    parseSlideItem(slideItems);
    super.onInit();
  }

  void parseSlideItem(List<SlideItem> list) {
    List<Widget> listWidgetPage = List.empty(growable: true);
    List<Widget> listWidgetSlide = List.empty(growable: true);

    for (int i = 0; i < list.length; i++) {
      var element = list.elementAt(i);
      listWidgetSlide.add(ListTile(
        title: Text(element.title),
        leading: Icon(element.icon),
        onTap: () {
          switchNavigationView(i);
        },
      ));
      listWidgetPage.add(element.mainView);
    }
    pageList = listWidgetPage;
    slideList = listWidgetSlide;
  }

  void switchNavigationView(int i) {
    pageController.animateToPage(i,
        duration: const Duration(microseconds: 200), curve: Curves.linear);
  }

  Widget get currentWidget {
    if (currentSelectIndex < pageList.length) {
      return pageList.elementAt(currentSelectIndex);
    } else {
      return const SizedBox.shrink();
    }
  }
}
