import 'dart:convert';
import 'package:flutter_dashboard/data/model/league_client_bo.dart';
import 'package:process_run/cmd_run.dart';
import 'package:process_run/shell_run.dart';

class ClientConnect {
  static LeagueClientBo? getConnectInfo() {
    final shell = ProcessCmd(
        "wmic PROCESS WHERE name='LeagueClientUx.exe' GET commandline", [],
        runInShell: true);
    runCmd(shell).then((value) {
      String cmdLine = value.outText;
      if (cmdLine.isNotEmpty && cmdLine.length > 10) {
        int port = int.parse(cmdLine.split("--app-port=")[1].split('"')[0]);
        int pid = int.parse(cmdLine.split('--app-pid=')[1].split('"')[0]);
        final bytes = utf8.encode(
            "riot:${cmdLine.split('--remoting-auth-token=')[1].split('"')[0]}");
        String basic = "Basic ${base64.encode(bytes)}";
        // print(
        //     "port is $port pid is $pid password is $basic  origin password riot:${cmdLine.split('--remoting-auth-token=')[1].split('"')[0]}");
        return LeagueClientBo(port, basic, pid);
      } else {
        return null;
      }
    });
    return null;
  }
}
