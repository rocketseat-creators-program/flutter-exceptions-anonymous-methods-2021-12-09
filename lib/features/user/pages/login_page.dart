import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, required this.onLogin}) : super(key: key);
  final Function() onLogin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: onLogin,
          child: Text('Entrar'),
        ),
      ),
    );
  }
}
