import 'package:lol_auto_accept/data/lcu.dart';
import 'package:lol_auto_accept/presentation/demo/controller/controller.dart';
import 'package:get/get.dart';

class DemoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DemoController());
    Get.put<LcuApi>(LcuApi());
  }
}
