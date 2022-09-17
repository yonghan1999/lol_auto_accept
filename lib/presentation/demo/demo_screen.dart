import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lol_auto_accept/core/app_export.dart';
import 'package:lol_auto_accept/presentation/demo/controller/controller.dart';

class HomePage extends GetWidget<DemoController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ObxValue((data) => Image.asset(controller.poroImg.value),
                  controller.poroImg),
            ),
            const SizedBox(
              height: 23,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "auto_accept".tr,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                Obx(() {
                  return CupertinoSwitch(
                    value: controller.isAccept.value,
                    onChanged: (value) {
                      controller.changeAutoAcceptState();
                    },
                  );
                })
              ],
            )
          ],
        )),
      ),
    );
  }
}
