import 'package:flutter_dashboard/presentation/demo/controller/controller.dart';
import 'package:get/get.dart';

class DemoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DemoController());
  }
}
