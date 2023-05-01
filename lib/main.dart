import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_navigation/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String appTitle = 'Navigator 1.0';
  String getInitialRoute() => AppRoutes.splash;

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appTitle,
        theme: ThemeData(primaryColor: Colors.blue),
        initialRoute: getInitialRoute(),
        onGenerateRoute: (route) => AppRoutes.getRoute(route),
      );
}
