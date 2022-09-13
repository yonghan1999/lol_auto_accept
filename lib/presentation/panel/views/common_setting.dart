import 'package:flutter/cupertino.dart';
import 'package:lol_auto_accept/core/app_export.dart';

class CommonSettingController extends GetxController {}

class CommonSetting extends StatelessWidget {
  CommonSetting(this.text, {super.key});

  final String text;

  final controller = Get.put(CommonSettingController());

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
