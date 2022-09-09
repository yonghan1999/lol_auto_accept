import 'package:flutter/material.dart';
import 'package:flutter_dashboard/core/app_export.dart';
import 'package:flutter_dashboard/presentation/demo/controller/controller.dart';

class HomePage extends GetWidget<DemoController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Text("auto_accept".tr),
        ),
        ObxValue(
          (data) => Switch(
            value: data.value,
            onChanged:
                data,
          ),
          controller.isAccept,
        ),
      ],
    ));
  }
}
