// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_29_5/generated/assets.dart';
import 'package:task_29_5/model/register/register_request_model.dart';
import 'package:task_29_5/routes/app_router.gr.dart';
import 'package:task_29_5/store/register/register_store.dart';
import 'package:task_29_5/values/app_color.dart';
import 'package:task_29_5/values/validators.dart';
import 'package:task_29_5/widgets/custom_button.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:task_29_5/widgets/text_form_field_custom.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void handleRegister(email, password) async {
    if (_formKey.currentState?.validate() ?? false) {
      var data = RegisterRequestModel(email: email, password: password);
      await register.registerFun(data);
      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
      context.router.replaceAll([const UserRoute()]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(
      builder: (context) {
        if (register.isLoading) {
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
                        'Create Account',
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
                        'Create an account so you can explore all the existing jobs',
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
                    TextFormFieldCustom(
                      hintText: 'Confirm Password',
                      obscureText: true,
                      controller: _confirmPasswordController,
                      validator: (value) => validateConfirmPassword(
                          value, _passwordController.text),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                        title: 'Sign up',
                        onPressed: () {
                          handleRegister(
                              _emailController.text, _passwordController.text);
                        }),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                        onTap: () {
                          context.router.back();
                        },
                        child: const Text(
                          'Already have an account',
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
