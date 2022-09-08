import 'dart:async';

import 'package:flutter_dashboard/core/app_export.dart';
import 'package:flutter_dashboard/data/lcu.dart';
import 'package:flutter_dashboard/data/utils/client_connect.dart';

class DemoController extends GetxController {
  RxInt isConnected = 0.obs;

  late final LcuApi lcuApi;

  late final Timer? connectGame;

  @override
  void onInit() {
    connectGame = Timer.periodic(const Duration(seconds: 2), (timer) {
      var bo = ClientConnect.getConnectInfo();
      if (bo != null) {
        lcuApi = LcuApi(bo);
        isConnected.value = 1;
      }
    });
    super.onInit();
  }

  void accept() {
    lcuApi.accept();
  }
}
