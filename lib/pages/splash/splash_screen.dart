import 'package:flutter/material.dart';
import 'package:flutter_navigation/app_routes.dart';
import 'package:flutter_navigation/main.dart';
import 'package:flutter_navigation/pages/login/login_arguments.dart';
import 'package:flutter_navigation/widget/button_widget.dart';
import 'package:flutter_navigation/widget/hearder_widget.dart';

class SplashScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text(MyApp.appTitle),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
             const HeaderWidget(title: 'Splash Page',),
              ButtonWidget(
                text: 'Push: Login + Data',
                onClicked: () async {
                  final args = LoginArguments(
                    userName: 'Borel Njeunkwe',
                    password: 'super_secret@password',
                  );
                  await Navigator.pushNamed(context, AppRoutes.login, arguments: args);
                },
              ),
              ButtonWidget(
                text: 'Push: Login + No Data',
                onClicked: () async {
                  await Navigator.pushNamed(context, AppRoutes.login);
                },
              ),
              const SizedBox(height: 10),
              ButtonWidget(
                text: 'Replace: Home (Guest)',
                onClicked: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.home,
                  ModalRoute.withName('/'),
                ),
              ),
            ],
          ),
        ),
      );
}