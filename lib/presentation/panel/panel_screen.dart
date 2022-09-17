import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lol_auto_accept/core/app_export.dart';
import 'package:lol_auto_accept/presentation/panel/controller/controller.dart';
import 'package:window_manager/window_manager.dart';

class PanelScreen extends GetWidget<PanelController> {
  const PanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.grey, width: 0.3))),
                child: Column(
                  children: [
                    DrawerHeader(
                        child: Center(
                      child: SizedBox(
                        height: 43,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(ImageConstant.imagePoroThank),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: defaultPadding),
                              child: Text(
                                "poro_tools".tr,
                                style: const TextStyle(
                                  fontSize: 27,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                    ...(controller.slideList)
                  ],
                ),
              ),
            ),
            // mainview
            Expanded(
              flex: 4,
              child: PageView.builder(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  controller.currentSelectIndex = index;
                  return controller.currentWidget;
                },
                itemCount: controller.pageList.length,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTapDown: (details) {
            windowManager.startDragging();
          },
          child: Container(
            color: Colors.transparent,
            height: appBarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Material(
                  color: Colors.transparent,
                  shape: const StadiumBorder(),
                  child: IconButton(
                      onPressed: () {
                        windowManager.minimize();
                      },
                      iconSize: 20,
                      icon: const Icon(Icons.minimize)),
                ),
                Material(
                  color: Colors.transparent,
                  shape: const StadiumBorder(),
                  child: IconButton(
                      onPressed: () {
                        exit(0);
                      },
                      iconSize: 20,
                      icon: const Icon(Icons.close)),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
