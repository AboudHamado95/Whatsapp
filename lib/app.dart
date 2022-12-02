import 'package:flutter/material.dart';
import 'package:whatsapp/config/routes/app_routes.dart';
import 'package:whatsapp/config/themes/app_theme.dart';
import 'package:whatsapp/core/utils/app_strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      initialRoute: Routes.initialRoute,
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}
