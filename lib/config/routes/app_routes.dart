import 'package:flutter/material.dart';
import 'package:whatsapp/core/utils/app_strings.dart';
import 'package:whatsapp/features/chat/presentation/screens/home_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String homeScreen = '/home_screen';
  static const String loginScreen = '/login_screen';
  static const String registerScreen = '/register_screen';
  static const String forgotPasswordScreen = '/forgot_password_screen';
  static const String createNewGroupScreen = '/create_new_group_screen';
  static const String singleChatScreen = '/single_chat_screen';
}

class AppRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return materialBuilder(widget: const HomeScreen());
      case Routes.homeScreen:
        return materialBuilder(widget: const HomeScreen());

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(child: Text(AppStrings.appName)),
      ),
    );
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
