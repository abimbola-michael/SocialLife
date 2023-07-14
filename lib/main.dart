import 'package:flutter/material.dart';
import 'pages/pages.dart';
import 'theme/colors.dart';

void main() {
  runApp(const MyApp());
}

// const primaryColor = Colors.deepPurple;
// final accentColor = Colors.deepPurple.withOpacity(0.2);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Life',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.black),
          color: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepPurple.withOpacity(0.2),
          backgroundColor: Colors.deepPurple,
        ),
        // colorScheme: ColorScheme.fromSwatch(
        //   accentColor: accentColor,
        //   primarySwatch: createMaterialColor(primaryColor),
        // ),
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
