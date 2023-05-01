import 'package:flutter/material.dart';
import 'package:flutter_navigation/app_routes.dart';
import 'package:flutter_navigation/main.dart';
import 'package:flutter_navigation/pages/home/home_arguments.dart';
import 'package:flutter_navigation/widget/button_widget.dart';
import 'package:flutter_navigation/widget/hearder_widget.dart';

class HomeScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final HomeArguments arguments;

  HomeScreen({
    super.key,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text(MyApp.appTitle),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const HeaderWidget(
                title: 'Home Page',
              ),
              const SizedBox(height: 10),
              Text(
                'User Token: ${arguments.userToken}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              ButtonWidget(
                text: 'Replace: Splash (Logout)',
                onClicked: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.splash,
                  ModalRoute.withName('/'),
                ),
              ),
            ],
          ),
        ),
      );
}
