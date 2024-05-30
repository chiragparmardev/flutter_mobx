import 'package:flutter/material.dart';

void showSnackbarCustom(BuildContext context, String message, bool isError) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: isError ? Colors.red : Colors.green,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
