
import 'package:flutter/material.dart';
import 'package:pta_contrib/core/theme/app_theme.dart';
import 'package:pta_contrib/screens/home_page.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Impact Fund App',
      theme: AppTheme.brownTheme, 
      home: const HomePage(), 
      debugShowCheckedModeBanner: false, 
    );
  }
}
