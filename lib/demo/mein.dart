import 'package:flutter/material.dart';
import 'package:musidroid/demo/new.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: [
      Locale('en','US'),
      Locale('en','GB'),
    ],
    path: 'assets/translations',
    saveLocale: true,
    fallbackLocale: Locale('en','US'),
    child: MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(useInheritedMediaQuery: true,
      theme: ThemeData(primarySwatch: Colors.blue),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: New(),
    );
}}
