// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_29_5/routes/app_router.gr.dart';
import 'package:task_29_5/values/app_color.dart';

@RoutePage()
class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  final storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    checkTokenAndRedirect();
  }

  void checkTokenAndRedirect() async {
    final token = await storage.read(key: 'token');
    await Future.delayed(Duration(seconds: 1));

    if (token != null && token.isNotEmpty) {
      context.router.replaceAll([const UserRoute()]);
    } else {
      context.router.replaceAll([const LoginRoute()]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: Center(
              child: Text('API Calls',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primary))),
        ),
      ),
    );
  }
}
