import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:task_29_5/generated/assets.dart';
import 'package:task_29_5/model/register/register_request_model.dart';
import 'package:task_29_5/routes/app_router.gr.dart';
import 'package:task_29_5/store/login/login_store.dart';
import 'package:task_29_5/values/app_color.dart';
import 'package:task_29_5/values/validators.dart';
import 'package:task_29_5/widgets/custom_button.dart';
import 'package:task_29_5/widgets/text_form_field_custom.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void handleLogin(email, password) async {
    if (_formKey.currentState?.validate() ?? false) {
      var data = RegisterRequestModel(email: email, password: password);
      await login.login(data);
      _emailController.clear();
      _passwordController.clear();
      context.router.replaceAll([const UserRoute()]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(
      builder: (context) {
        if (login.isLoading) {
          return Align(
            alignment: Alignment.center,
            child: Lottie.asset(Assets.imagesLoading,
                width: 200, height: 200, fit: BoxFit.contain),
          );
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        'Login here',
                        style: TextStyle(
                          fontSize: 30,
                          color: AppColor.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Welcome back you’ve been missed!",
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColor.black,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 53,
                    ),
                    TextFormFieldCustom(
                      hintText: 'Email',
                      obscureText: false,
                      validator: validateEmail,
                      controller: _emailController,
                    ),
                    TextFormFieldCustom(
                      hintText: 'Password',
                      obscureText: true,
                      controller: _passwordController,
                      validator: validatePassword,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                        title: 'Sign in',
                        onPressed: () {
                          handleLogin(
                              _emailController.text, _passwordController.text);
                        }),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                        onTap: () {
                          context.router.push(const RegisterRoute());
                        },
                        child: const Text(
                          'Create new account',
                          style: TextStyle(
                            color: AppColor.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        }
      },
    ));
  }
}
