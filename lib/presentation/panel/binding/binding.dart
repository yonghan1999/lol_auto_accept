import 'package:get/get.dart';
import 'package:lol_auto_accept/presentation/panel/controller/controller.dart';

import '../views/chose_hero.dart';

class PanelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PanelController());
  }
}
