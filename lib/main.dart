import 'package:flutter/material.dart';
import 'package:patrocle_education/Themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'Homepage/homepage.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(create: (context) => ThemeProvider(),
  child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(selectedIndex: 2),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
