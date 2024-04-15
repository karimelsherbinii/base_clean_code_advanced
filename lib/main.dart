import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teach_me/app.dart';
import 'core/api/cache_helper.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  CacheHelper.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.white,
    systemNavigationBarColor: Colors.white,
  ));
  runApp(const TeachMeApp());
  
}
