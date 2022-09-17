import 'dart:developer';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:lol_auto_accept/data/lcu.dart';
import 'package:lol_auto_accept/data/lcu_socket.dart';
import 'package:lol_auto_accept/data/utils/client_connect.dart';


class BadCertificateHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true; // add your localhost detection logic here if you want
  }
}

void main() {
  test("print port and basic", () async {
    await ClientConnect.getConnectInfo().then((value) => print("port: ${value.port}   basic: ${value.basic}   password: ${value.password}"));
  });
}
