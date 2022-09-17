import 'package:lol_auto_accept/core/app_export.dart';
import 'package:lol_auto_accept/data/lcu.dart';
import 'package:lol_auto_accept/data/lcu_socket.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() async {
    Get.put<LcuSocket>(LcuSocket());
    Get.put<LcuApi>(LcuApi());
  }
}
