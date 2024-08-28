import 'package:cat_flutter_project/src/core/env/env.dart';
import 'package:cat_flutter_project/src/features/app/app.dart';
import 'package:cat_flutter_project/injecction_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'injecction_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp();
  await di.init();
  sl.registerLazySingleton(() => Env(EnvMode.qA));
//  NotificationsFCM(messaging: FirebaseMessaging.instance);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(App());
  });
}