import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lol_auto_accept/core/app_export.dart';
import 'package:lol_auto_accept/data/lcu.dart';
import 'package:lol_auto_accept/data/lcu_socket.dart';
import 'package:lol_auto_accept/data/model/champ/select/champ_select_info.dart';
import 'package:lol_auto_accept/data/model/hero_info.dart';
import 'package:lol_auto_accept/data/model/league_client_bo.dart';
import 'package:lol_auto_accept/data/model/socket_json_body.dart';
import 'package:lol_auto_accept/data/utils/client_connect.dart';

import '../model/slide_item.dart';
import '../views/chose_hero.dart';
import '../views/view_export.dart';

class PanelController extends GetxController {
  /// --------------- 侧边 和 pageView 配置-------------------
  // 配置
  List<SlideItem> slideItems = List.from([
    SlideItem(
        title: "common_settings".tr,
        mainView: CommonSetting(),
        icon: Icons.settings),
    // SlideItem(title: "webcaster_settings".tr, mainView: CommonSetting(), icon: Icons.face),
    // SlideItem(
    //     title: "about".tr, mainView: CommonSetting(), icon: Icons.info_outline),
    // SlideItem(
    //     title: "dev",
    //     mainView: ChoseHero(),
    //     icon: Icons.face),
  ]);

  // 页面控制器
  late final PageController pageController;

  //当前显示标签页面的标识
  int currentSelectIndex = 0;

  /// 配置生成的数据
  // 保存侧边的List
  List<Widget> slideList = [];

  // 保存页面的List
  List<Widget> pageList = [];

  /// 全局程序配置
  // 检测是否连接游戏
  late final Timer? connectGame;

  // 检测游戏状态并执行相关功能
  // Timer? toolLoop;

  /// -------------------- 全局功能配置设置------------------------
  // 是否已经连接客户端
  RxInt isConnected = 0.obs;

  // 是否自动接受
  RxBool isAccept = RxBool(false);

  // 是否自动选择英雄
  RxBool isAutoSelect = RxBool(false);

  // 是否自动ban英雄
  RxBool isAutoBan = RxBool(false);

  // 自动选择英雄列表
  RxList<HeroInfo> autoSelectList =
      RxList.filled(7, HeroInfo.fromJsonMap(nonHero));

  // 自动选择英雄列表
  RxList<HeroInfo> autoBanList =
      RxList.filled(7, HeroInfo.fromJsonMap(nonHero));

  /// 检测游戏是否成功连接，初始化页面控制
  @override
  void onInit() {
    connectGame = Timer.periodic(const Duration(seconds: 2), (timer) {
      var bo = ClientConnect.getConnectInfo();
      bo.then((value) {
        var lcu = Get.find<LcuApi>();
        lcu.setHttpClient(value);
        if (isConnected.value == 0) {
          isConnected.value = 1;
        }
        if (isConnected.value == 1) {
          // lol客户端是否已经准备就绪
          lcu.settingReady().then((isReady) {
            if (isReady) {
              // 启动工具
              enableTool(value);
              isConnected.value = 2;
            }
          });
        }
        if (ProgressDialogUtils.isProgressVisible) {
          ProgressDialogUtils.hideProgressDialog();
        }
      }).catchError((error, stackTrace) {
        if (!ProgressDialogUtils.isProgressVisible) {
          ProgressDialogUtils.showTitleProgressDialog("connecting_client".tr);
          disableTool();
          isConnected.value = 0;
        }
      });
    });

    pageController = PageController(initialPage: 0, keepPage: true);
    parseSlideItem(slideItems);
    super.onInit();
  }

  @override
  void onReady() {
    if (isConnected.value == 0) {
      ProgressDialogUtils.showTitleProgressDialog("connecting_client".tr);
    }
    super.onReady();
  }

  /// 工具监听游戏状态并执行相关配置
  void enableTool(LeagueClientBo bo) {
    var socket = Get.find<LcuSocket>();
    var lcuApi = Get.find<LcuApi>();
    socket.connectJsonEventApiSocket(bo);
    socket.channel!.stream.listen((message) {
      try {
        var data = json.decode(message);
        if (data is List) {
          List response = data;
          if (response.length == 3) {
            SocketJsonBody body = SocketJsonBody.fromJsonMap(response[2]);
            if (body.uri == champSelectSession) {
              ChampSelectInfo info = ChampSelectInfo.fromJsonMap(body.data);
              var localPlayerCellId = info.localPlayerCellId;
              for (var action in info.actions) {
                for (var actionElement in action) {
                  // 轮到你操作时
                  if (actionElement.actorCellId == localPlayerCellId &&
                      actionElement.isInProgress) {
                    var userActionId = actionElement.id;
                    // 轮到你选择英雄,并且开启了自动选英雄
                    if (actionElement.type == "pick" &&
                        !actionElement.completed &&
                        isAutoSelect.value) {
                      Set bans = {};
                      bans.addAll(info.bans.myTeamBans);
                      bans.addAll(info.bans.theirTeamBans);
                      for (var element in info.actions) {
                        for (var item in element) {
                          if (item.completed && item.championId != 0) {
                            bans.add(item.championId);
                          }
                        }
                      }
                      HeroInfo? hero = autoSelectList.firstWhereOrNull(
                          (element) =>
                              !bans.contains(element.id) && element.id != 0);
                      // TODO 候选列表中的英雄都被ban了... 暂不处理
                      if (hero == null) {
                      } else {
                        lcuApi.lockHero(userActionId, hero.id);
                      }
                    }
                    // TODO ban 英雄
                    if (actionElement.type == "ban" &&
                        !actionElement.completed &&
                        isAutoBan.value) {
                      Set used = {};
                      used.addAll(info.bans.myTeamBans);
                      used.addAll(info.bans.theirTeamBans);
                      for (var element in info.actions) {
                        for (var item in element) {
                          if (item.championId != 0) {
                            used.add(item.championId);
                          }
                        }
                      }
                      HeroInfo? hero = autoBanList.firstWhereOrNull((element) =>
                          !used.contains(element.id) && element.id != 0);
                      // TODO 候选列表中的英雄都已经被ban了或者队友预选... 暂不处理
                      if (hero == null) {
                      } else {
                        lcuApi.banHero(userActionId, hero.id);
                      }
                    }
                  }
                }
              }
            }

            //  当前游戏状态
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
            if (body.uri == getGameState) {
              switch (body.data) {
                case "None":
                  break;
                case "Lobby":
                  break;
                case "Matchmaking":
                  break;
                case "ReadyCheck":
                  if (isAccept.value) {
                    lcuApi.accept();
                  }
                  break;
                case "ChampSelect":
                  break;
                case "InProgress":
                  break;
                case "PreEndOfGame":
                  break;
                case "WaitingForStats":
                  break;
                case "EndOfGame":
                  break;
                case "Reconnect":
                  break;
              }
            }
          }
        }
      } catch (e, stacktrace) {
        debugPrintStack(stackTrace: stacktrace);
        // printError(info: "socket json parse error $message");
      }
    });

    // toolLoop ??= Timer.periodic(const Duration(seconds: 1), (timer) {
    //   Get.find<LcuApi>().gameState().then((value) {
    //     if (value == "\"ReadyCheck\"" && isAccept.value) {
    //       Get.find<LcuApi>().accept();
    //     }
    //     else if(value == "\"ChampSelect\"" && isAutoSelect.value) {
    //
    //     }
    //   });
    // });
  }

  void disableTool() {
    var socket = Get.find<LcuSocket>();
    socket.close();
  }

  /// ----------- 页面和侧边相关工具 -------------------------
  // 解析配置
  void parseSlideItem(List<SlideItem> list) {
    List<Widget> listWidgetPage = List.empty(growable: true);
    List<Widget> listWidgetSlide = List.empty(growable: true);

    for (int i = 0; i < list.length; i++) {
      var element = list.elementAt(i);
      listWidgetSlide.add(ListTile(
        title: Text(
          element.title,
        ),
        leading: Icon(element.icon),
        onTap: () {
          switchNavigationView(i);
        },
      ));
      listWidgetPage.add(element.mainView);
    }

    // 添加选择英雄页面
    /*------- 以下需要保持顺序 --------*/
    listWidgetPage.add(ChoseHero(autoBanList, 0, title: "ban"));
    listWidgetPage.add(ChoseHero(autoSelectList, 0, title: "pick"));
    /*------- 以上需要保持顺序 --------*/
    pageList = listWidgetPage;
    slideList = listWidgetSlide;
  }

  // 切换页面
  void switchNavigationView(int i) {
    pageController.jumpToPage(i);
  }

  // 获取当前页面
  Widget get currentWidget {
    if (currentSelectIndex < pageList.length) {
      return pageList.elementAt(currentSelectIndex);
    } else {
      return const SizedBox.shrink();
    }
  }

  void toChoseSelectHeroPage() {
    var choseHeroIndex = pageList.length - 1;
    switchNavigationView(choseHeroIndex);
  }

  void toBanHeroPage() {
    var banIndex = pageList.length - 2;
    switchNavigationView(banIndex);
  }
}
