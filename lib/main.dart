import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:xizmat_uz/ui/registration_page.dart';

import 'generated/l10n.dart';

// import 'package:graphql_flutter/graphql_flutter.dart';

Future<void> main() async {
  // await initHiveForFlutter();

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
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: "SemiCondensed"),
            centerTitle: true,

          )),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        primary: true,
        appBar: AppBar(
          title: Text(S.current.online_reg),

          elevation: 0,
        ),
        body: Container(

              child: RegistrattionPageWidget(),)
        );
  }
}
