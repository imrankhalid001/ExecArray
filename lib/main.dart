import 'package:exec_array/provider/product_provider.dart';
import 'package:exec_array/provider/user_provider.dart';
import 'package:exec_array/provider/cart_provider.dart';
import 'package:exec_array/routes/routes.dart';
import 'package:exec_array/routes/routes_name.dart';
import 'package:exec_array/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()..loadCartItems()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const
   MyApp({super.key});

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
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
      home:  HomePage(), 
    );
  }
}
