import 'package:flutter/material.dart';
import 'package:lol_auto_accept/core/app_export.dart';
import 'package:lol_auto_accept/presentation/panel/controller/controller.dart';

class PanelScreen extends GetWidget<PanelController> {
  const PanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
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
                          padding: EdgeInsets.only(left: defaultPadding),
                          child: Text(
                            "poro_tools".tr,
                            style: TextStyle(
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

          // mainview
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.white,
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
          ),
        ],
      ),
    );
  }
}
