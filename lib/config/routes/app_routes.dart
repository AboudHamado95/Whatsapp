import 'package:flutter/material.dart';
import 'package:whatsapp/core/utils/app_strings.dart';
import 'package:whatsapp/features/chat/presentation/screens/camera_screen.dart';
import 'package:whatsapp/features/chat/presentation/screens/create_group_screen.dart';
import 'package:whatsapp/features/chat/presentation/screens/home_screen.dart';
import 'package:whatsapp/features/chat/presentation/screens/landing_screen.dart';
import 'package:whatsapp/features/chat/presentation/screens/login_screen.dart';
import 'package:whatsapp/features/chat/presentation/screens/select_contact_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String homeScreen = '/home_screen';
  static const String loginScreen = '/login_screen';
  static const String createGroupScreen = '/create_ group_screen';
  static const String cameraScreen = '/camera_screen';
  static const String selectContactScreen = '/select_contact_screen';
}

class AppRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return materialBuilder(widget: const LandingScreen());
      case Routes.homeScreen:
        return materialBuilder(widget: const HomeScreen());
      case Routes.loginScreen:
        return materialBuilder(widget: const LoginScreen());
      case Routes.cameraScreen:
        return materialBuilder(widget: const CameraScreen());
      case Routes.createGroupScreen:
        return materialBuilder(widget: const CreateGroupScreen());
      case Routes.selectContactScreen:
        return materialBuilder(widget: const SelectContactScreen());

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
