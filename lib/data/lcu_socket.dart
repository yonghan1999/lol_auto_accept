import 'package:lol_auto_accept/core/app_export.dart';
import 'package:web_socket_channel/io.dart';

import 'model/league_client_bo.dart';

class LcuSocket {

  Map<String, String> customHeaders = {};

  late String url;
  LeagueClientBo? leagueClientBo;

   IOWebSocketChannel? channel;

  void connectJsonEventApiSocket(LeagueClientBo bo) {

    if (channel != null) {
      close();
      _connect(bo);
    }
    else {
      _connect(bo);
    }
  }

  void _connect(LeagueClientBo bo) {
    leagueClientBo = bo;
    url = "wss://127.0.0.1:${bo.port}";
    customHeaders['Authorization'] = bo.basic;
    var uri = Uri.parse(url);
    channel = IOWebSocketChannel.connect(uri,headers: customHeaders);
    channel!.sink.add("[5, \"OnJsonApiEvent\"]");
  }

  void close() {
    if(channel != null) {
      channel!.sink.close();
      channel = null;
    }
  }
}