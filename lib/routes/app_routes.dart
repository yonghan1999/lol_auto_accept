import 'package:get/get.dart';
import 'package:lol_auto_accept/presentation/panel/binding/binding.dart';
import 'package:lol_auto_accept/presentation/panel/panel_screen.dart';

import '../presentation/presentation_export.dart';

// class AppRoutes {
//   static String initPage = '/init';

//   static List<GetPage> pages = [
//     GetPage(
//       name: initPage,
//       page: () => const HomePage(),
//       bindings: [
//         DemoBinding(),
//       ],
//     ),
//   ];
// }


class AppRoutes {
  static String initPage = '/init';

  static List<GetPage> pages = [
    GetPage(
      name: initPage,
      page: () => PanelScreen(),
      bindings: [
        PanelBinding(),
      ],
    ),
  ];
}
