import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import 'core/app_export.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WindowManager.instance.ensureInitialized();
  windowManager.waitUntilReadyToShow().then((_) async {
    // await windowManager.setSize(const Size(250, 75));
    await windowManager.setSize(const Size(333, 333));
    await windowManager.setMinimumSize(const Size(333, 333));
    await windowManager.center();
    await windowManager.show();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      title: 'jhin',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initPage,
      getPages: AppRoutes.pages,
    );
  }
}
