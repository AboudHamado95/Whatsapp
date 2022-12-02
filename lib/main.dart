import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp/app.dart';
import 'package:whatsapp/bloc_observer.dart';
import 'package:whatsapp/core/cache/cache_helper.dart';

import 'injection_container.dart' as di;
late List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await CacheHelper.init();
  await di.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
