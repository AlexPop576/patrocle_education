import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:patrocle_education/Database/database_helper.dart';
import 'package:patrocle_education/Themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'Homepage/homepage.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }  //asta e pentru baza de date

  await DatabaseHelper.instance.init();
  runApp(ChangeNotifierProvider(create: (context) => ThemeProvider(),
  child: const MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(selectedIndex: 1),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
