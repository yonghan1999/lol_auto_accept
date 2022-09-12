import 'package:lol_auto_accept/data/lcu.dart';
import 'package:get/get.dart';
import 'package:lol_auto_accept/presentation/panel/controller/controller.dart';

class PanelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PanelController());
    Get.put<LcuApi>(LcuApi());
  }
}
