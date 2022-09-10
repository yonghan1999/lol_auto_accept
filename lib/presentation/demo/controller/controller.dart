import 'dart:async';

import 'package:lol_auto_accept/core/app_export.dart';
import 'package:lol_auto_accept/data/lcu.dart';
import 'package:lol_auto_accept/data/utils/client_connect.dart';

class DemoController extends GetxController {
  RxInt isConnected = 0.obs;

  RxBool isAccept = RxBool(false);

  late final Timer? connectGame;

  Timer? toolLoop;

  RxString poroImg = "assets/images/sleep.png".obs;

  @override
  void onInit() {
    connectGame = Timer.periodic(const Duration(seconds: 2), (timer) {
      var bo = ClientConnect.getConnectInfo();
      bo.then((value) {
        Get.find<LcuApi>().setHttpClient(value);
        isConnected.value = 1;
        if (ProgressDialogUtils.isProgressVisible) {
          if(isAccept.value) {
            poroImg.value = "assets/images/thank.png";
          }
          else {
            poroImg.value = "assets/images/happy.png";
          }
          ProgressDialogUtils.hideProgressDialog();
        }
        if (toolLoop == null || !(toolLoop!.isActive)) {
          enableTool();
        }
      }).catchError((error, stackTrace) {
        if (!ProgressDialogUtils.isProgressVisible) {
          poroImg.value = "assets/images/sleep.png";
          // update();
          ProgressDialogUtils.showTitleProgressDialog("connecting_client".tr);
        }
        if (toolLoop != null && toolLoop!.isActive) {
          disableTool();
        }
      });
    });
    super.onInit();
  }

  @override
  void onReady() {
    if (isConnected.value == 0) {
      ProgressDialogUtils.showTitleProgressDialog("connecting_client".tr);
    }
    super.onReady();
  }

//
  //  查看游戏当前状态
  //  游戏大厅:None
  //  房间内:Lobby
  //  匹配中:Matchmaking
  //  找到对局:ReadyCheck
  //  选英雄中:ChampSelect
  //  游戏中:InProgress
  //  游戏即将结束:PreEndOfGame
  //  等待结算页面:WaitingForStats
  //  游戏结束:EndOfGame
  //  等待重新连接:Reconnect
  //
  void enableTool() {
    toolLoop ??= Timer.periodic(const Duration(seconds: 3), (timer) {
      Get.find<LcuApi>().gameState().then((value) {
        if (value == "\"ReadyCheck\"" && isAccept.value) {
          Get.find<LcuApi>().accept();
        }
      });
    });
  }

  void disableTool() {
    if (toolLoop != null && toolLoop!.isActive) {
      toolLoop!.cancel();
    }
    toolLoop = null;
  }

  void changeAutoAcceptState() {
    isAccept.value = !(isAccept.value);
    if(isAccept.value) {
      poroImg.value = "assets/images/thank.png";
    }
    else {
      poroImg.value = "assets/images/happy.png";
    }
  }
}
