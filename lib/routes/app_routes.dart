import 'package:get/get.dart';

import '../presentation/presentation_export.dart';

class AppRoutes {
  static String initPage = '/init';

  static List<GetPage> pages = [
    GetPage(
      name: initPage,
      page: () => const HomePage(),
      bindings: [
        DemoBinding(),
      ],
    ),
  ];
}
