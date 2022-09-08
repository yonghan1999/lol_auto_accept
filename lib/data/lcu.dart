import 'package:flutter_dashboard/core/app_export.dart';
import 'package:flutter_dashboard/data/model/league_client_bo.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class LcuApi extends GetConnect {
  final LeagueClientBo bo;

  LcuApi(this.bo);

  static const String acceptGame = "/lol-matchmaking/v1/ready-check/accept";

  @override
  void onInit() {
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
    httpClient.post(acceptGame, body: null);
  }
}
