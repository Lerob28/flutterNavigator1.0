import 'package:flutter/material.dart';
import 'package:flutter_navigation/pages/home/home_arguments.dart';

import 'pages/home/home_screen.dart';
import 'pages/login/login_arguments.dart';
import 'pages/login/login_screen.dart';
import 'pages/splash/splash_screen.dart';

abstract class AppRoutes {
  static const home = '/home';
  static const splash = '/splash';
  static const login = '/login';

  static Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return buildRoute(SplashScreen(), settings: settings);
      case AppRoutes.login:
        final LoginArguments args = settings.arguments as LoginArguments;
        return args.userName.isEmpty 
        ? throw Exception('Error: No login userName find')
        : args.password.isEmpty
        ? throw Exception('Error: No login password find')
        : buildRoute(LoginScreen(arguments: args), settings: settings);
      case AppRoutes.home:
        final HomeArguments defaultArguments = HomeArguments(userToken: '');
        final HomeArguments args = settings.arguments as HomeArguments ?? defaultArguments ;
        return buildRoute(HomeScreen(arguments: args), settings: settings);
      default:
        return buildRoute(
            const Placeholder(
              child: Text('No page for this route!'),
            ),
            settings: settings);
    }
  }

  static MaterialPageRoute buildRoute(
    Widget child, {
    required RouteSettings settings,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => child,
    );
  }
}
