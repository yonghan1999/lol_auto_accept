import 'package:lol_auto_accept/core/app_export.dart';
import 'package:lol_auto_accept/data/model/champ/select/champ_select_info.dart';
import 'package:lol_auto_accept/data/model/hero_info.dart';
import 'package:lol_auto_accept/data/model/league_client_bo.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import 'model/champions/champion.dart';

class LcuApi extends GetConnect {

  final Map<String, String> customHeaders = {};

  LeagueClientBo? leagueClientBo;

  void setHttpClient(LeagueClientBo bo) {
    leagueClientBo = bo;
    allowAutoSignedCert = true;
    httpClient.baseUrl = "https://127.0.0.1:${bo.port}";
    customHeaders['Accept'] = 'application/json';
    customHeaders['Authorization'] = bo.basic;
    httpClient.addRequestModifier((Request request) {
      request.headers.addAll(customHeaders);
      return request;
    });
    httpClient.defaultContentType = "application/json";
    httpClient.addAuthenticator((Request request) {
      request.headers['Authorization'] = customHeaders['Authorization']!;
      return request;
    });
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

  Future<List<HeroInfo>> getHero() {
    return get<List<HeroInfo>>(getHeroList, decoder: (data) {
      List<HeroInfo> result = List.empty(growable: true);
      var list = List.from(data);
      for (var element in list) {
        result.add(HeroInfo.fromJsonMap(element));
      }
      return result;
    }).then((value) {
      if(value.body != null) {
        return value.body!;
      }
      else {
        return Future.error("empty response body");
      }
    });
  }

  Future<List<Champion>> getOwnedHero() {
    return get<List<Champion>>(getOwnedChampions,decoder:(data) {
      List<Champion> result = List.empty(growable: true);
      var list = List.from(data);
      for (var element in list) {
        result.add(Champion.fromJsonMap(element));
      }
      return result;
    },).then((value) {
      if(value.body != null) {
        return value.body!;
      }
      else {
        return Future.error("empty response body");
      }
    });
  }
  


  void lockHero(int userActionId, int champId) {
    patch("$champSelectAction/$userActionId", {
      "actorCellId":userActionId,
      "completed": true,
      "type": "pick",
      "championId": champId
    });
  }

  Future<bool> settingReady() {
    return get(lolSettingReady).then((value) {
      return value.body == true ? true : false;
    });
  }




}
