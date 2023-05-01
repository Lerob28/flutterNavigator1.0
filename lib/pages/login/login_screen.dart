import 'package:flutter/material.dart';
import 'package:flutter_navigation/app_routes.dart';
import 'package:flutter_navigation/main.dart';
import 'package:flutter_navigation/pages/home/home_arguments.dart';
import 'package:flutter_navigation/pages/login/login_arguments.dart';
import 'package:flutter_navigation/widget/button_widget.dart';
import 'package:flutter_navigation/widget/hearder_widget.dart';

class LoginScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final LoginArguments arguments;

  LoginScreen({
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
              const HeaderWidget(title: 'Login Page'),
              Text(
                'Username: ${arguments.userName}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'password: ${arguments.password}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              ButtonWidget(
                text: 'Replace: Home (Login)',
                onClicked: () {
                  final args = HomeArguments(userToken: 'MyUserToken|789@#255');
                  
                  Navigator.pushNamedAndRemoveUntil(   // remove all the page under this one
                    context,
                    AppRoutes.home,
                    ModalRoute.withName('/'),
                    arguments: args,
                  );
                },
              ),
              const SizedBox(height: 10),
              ButtonWidget(
                text: 'Pop: Splash',
                onClicked: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      );
}
