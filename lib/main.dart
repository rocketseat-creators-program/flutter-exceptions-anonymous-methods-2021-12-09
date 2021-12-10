import 'package:exceptions_flutter/features/user/controller/login_controller.dart';
import 'package:exceptions_flutter/features/user/repository/user_repository.dart';
import 'package:flutter/material.dart';

import 'core/error/error_center.dart';
import 'features/user/pages/login_builder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exceptions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(
        builder: (context) {
          return LoginBuilder(
            controller: LoginController(
              UserRepository(),
              (message) => errorDialog(
                message,
                context,
                () => Navigator.of(context).pop(),
              ),
            ),
          );
        },
      ),
    );
  }
}
