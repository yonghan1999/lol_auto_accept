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
                child: Image.asset('assets/logo.png'),
              ),
              const SizedBox(
                height: 23,
              ),
              Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Text("auto_accept".tr, style: const TextStyle(fontSize: 24),),
              ),
              ObxValue(
                (data) => CupertinoSwitch(
                  value: data.value,
                  onChanged: data,
                ),
                controller.isAccept,
              ),
            ],
          )
            ],
          )
          ),
        ), 
      );
  }
}
