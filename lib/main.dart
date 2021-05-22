import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

import 'app/constants/constants.dart';
import 'app/routes/app_pages.dart';
import 'app/translations/app_translations.dart';
import 'app/utils/utils.dart';
import 'app/ui/ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DotEnv.load();
  await Firebase.initializeApp();
  await SystemChrome.setEnabledSystemUIOverlays([]);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  AppPref.initListener();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialBinding: HomeBinding(),
    initialRoute: Routes.HOME,
    theme: appThemeData,
    defaultTransition: Transition.fadeIn,
    getPages: AppPages.pages,
    home: HomeScreen(),
    locale: Locale('vi', 'VN'),
    translationsKeys: AppTranslation.translations,
    builder: EasyLoading.init(),
  ));
}
