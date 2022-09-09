import 'package:lol_auto_accept/core/app_export.dart';
import 'package:lol_auto_accept/data/model/league_client_bo.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class LcuApi extends GetConnect {
  static const String acceptGame = "/lol-matchmaking/v1/ready-check/accept";
  static const String getGameState = "/lol-gameflow/v1/gameflow-phase";

  void setHttpClient(LeagueClientBo bo) {
    allowAutoSignedCert = true;
    httpClient.baseUrl = "https://127.0.0.1:${bo.port}";
    httpClient.addRequestModifier((Request request) async {
      Map<String, String> headers = {
        'Accept': 'application/json',
      };
      request.headers.addAll(headers);
      return request;
    });
    httpClient.defaultContentType = "application/json";
    httpClient.addAuthenticator((Request request) async {
      request.headers['Authorization'] = bo.basic;
      return request;
    });

    super.onInit();
  }

  void accept() {
    post(acceptGame, null);
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
  Future<String> gameState() {
    return get(getGameState).then((value) {
      if (value.status.isOk) {
        return value.bodyString!;
      } else {
        return Future.error(value);
      }
    });
  }
}
