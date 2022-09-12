import 'package:flutter/cupertino.dart';
import 'package:lol_auto_accept/core/app_export.dart';

class CommonSettingController extends GetxController {}

class CommonSetting extends GetView<CommonSettingController> {
  const CommonSetting(this.text,{super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    Get.put(CommonSettingController());

    return Text(text);
  }
}
