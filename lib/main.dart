import 'package:exec_array/routes/routes.dart';
import 'package:exec_array/routes/routes_name.dart';
import 'package:exec_array/ui/home_screen.dart';
import 'package:exec_array/ui/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         primaryColor:  Color(0xFF326381),
         colorScheme: ColorScheme.fromSeed(seedColor:Color(0xFF326381)),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.home,
      onGenerateRoute: Routes.generateRoute,
      home:  HomePage(),
    );
  }
}
