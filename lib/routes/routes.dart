import 'package:exec_array/routes/routes_name.dart';
import 'package:exec_array/ui/home_screen.dart';
import 'package:exec_array/ui/login_screen.dart';
import 'package:exec_array/ui/my_details_screen.dart';
import 'package:exec_array/ui/signup_screen.dart';
import 'package:exec_array/ui/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());

      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpScreen());

   case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());

            
   case RoutesName.myDetailsScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  MyDetailsScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route found'),
            ),
          );
        });
    }
  }
}
