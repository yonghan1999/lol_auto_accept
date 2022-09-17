import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lol_auto_accept/core/app_export.dart';

import '../controller/controller.dart';

class CommonSettingController extends GetxController {
  // RxBool isAccept = RxBool(false);

  RxBool get isAccept {
    return Get.find<PanelController>().isAccept;
  }

  RxBool get isAutoSelect {
    return Get.find<PanelController>().isAutoSelect;
  }

  void toChoseSelectHeroPage() {
    Get.find<PanelController>().toChoseSelectHeroPage();
  }

}

class CommonSetting extends StatelessWidget {
  CommonSetting({super.key});

  final controller = Get.put(CommonSettingController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: appBarHeight,
          ),
          Container(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              "${'common_settings'.tr}:",
              style: const TextStyle(fontSize: 38),
            ),
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(
                  defaultPadding * 3, 0, defaultPadding * 3, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      listItemText("auto_accept".tr),
                      const Spacer(),
                      ObxValue((data) {
                        return CupertinoSwitch(
                            value: data.value, onChanged: data);
                      }, controller.isAccept)
                    ],
                  ),
                  Row(
                    children: [
                      listItemText("auto_chose_hero".tr),
                      const Spacer(),
                      IconButton(onPressed: (){
                        controller.toChoseSelectHeroPage();
                      }, icon: const Icon(Icons.menu)),
                      ObxValue((data) {
                        return CupertinoSwitch(
                            value: data.value, onChanged: data);
                      }, controller.isAutoSelect)
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget listItemText(String tras) =>
      Text(tras.tr, style: const TextStyle(fontSize: 20));
}
