
import 'package:flutter/material.dart';
import 'package:pta_contrib/core/theme/app_theme.dart';
import 'package:pta_contrib/screens/home_page.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Runs the MyApp widget, which is the root of our application.
  runApp(const MyApp());
}

/// The root widget of the application.
/// It sets up the Material Design app and applies the custom theme.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Impact Fund App', // Title for the app (appears in task switcher)
      theme: AppTheme.brownTheme, // Apply the custom brown theme
      home: const HomePage(), // Set HomePage as the initial screen
      debugShowCheckedModeBanner: false, // Hide the debug banner
    );
  }
}
