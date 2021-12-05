import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xizmat_uz/auth/login_page.dart';
import 'package:xizmat_uz/ui/constants.dart';
import 'package:xizmat_uz/ui/home_page.dart';

import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (GetPlatform.isAndroid) {
    final documentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(documentDirectory.path);
  }
  await Hive.openBox("token");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // HasuraConnect connect = HasuraConnect(
    //   'http://localhost:8080/v1/graphql',
    // );
    // connect.query("document");
    return GetMaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: const [
          S.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              color: appColor,
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: "SemiCondensed"),
              centerTitle: true,
            )),
        home: LoginPage() // const MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}
