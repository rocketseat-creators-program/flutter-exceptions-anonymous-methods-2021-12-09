import 'package:exceptions_flutter/core/error/error.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key, required this.failure, required this.onRetry})
      : super(key: key);
  final Failure failure;
  final Function() onRetry;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(failure.message!),
      ),
      bottomNavigationBar: TextButton(
        onPressed: onRetry,
        child: Text('Tentar novamente'),
      ),
    );
  }
}

Future<void> errorDialog(
    String message, BuildContext context, Function() onClose) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: onClose,
            child: Text('Ok'),
          ),
        ],
      );
    },
  );
}
