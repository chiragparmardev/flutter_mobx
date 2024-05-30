import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task_29_5/model/user/user_update_request_model.dart';
import 'package:task_29_5/store/user/user_store.dart';
import 'package:task_29_5/values/app_color.dart';
import 'package:task_29_5/values/validators.dart';
import 'package:task_29_5/widgets/custom_button.dart';
import 'package:task_29_5/widgets/text_form_field_custom.dart';

@RoutePage()
class ManageUserScreen extends StatefulWidget {
  final int? userId;
  final String? name;
  final String? job;

  const ManageUserScreen({super.key, this.userId, this.name, this.job});

  @override
  State<ManageUserScreen> createState() => _ManageUserScreenState();
}

class _ManageUserScreenState extends State<ManageUserScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _jobController = TextEditingController();

  @override
  void initState() {
    if (widget.userId != null) {
      _nameController.text = widget.name ?? '';
      _jobController.text = widget.job ?? '';
    }
    super.initState();
  }

  void handleSubmit(int? id, String? name, String? job) async {
    if (_formKey.currentState?.validate() ?? false) {
      if (widget.userId != null) {
        await user.updateUser(id!,
            UserUpdateRequestModel(name: name.toString(), job: job.toString()));
      } else {
        await user.createUser(
            UserUpdateRequestModel(name: name.toString(), job: job.toString()));
      }
      _nameController.clear();
      _jobController.clear();
      context.router.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        centerTitle: true,
        title: Text(
          widget.userId == null ? 'Create User' : 'Update User',
          style: const TextStyle(
            color: AppColor.white,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              context.router.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColor.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormFieldCustom(
                  hintText: 'Name',
                  obscureText: false,
                  validator: (value) => validateEmpty(value, 'Name'),
                  controller: _nameController,
                ),
                TextFormFieldCustom(
                  hintText: 'Job',
                  obscureText: false,
                  validator: (value) => validateEmpty(value, 'Job'),
                  controller: _jobController,
                ),
                CustomButton(
                    title: widget.userId == null ? 'Create' : 'Update',
                    onPressed: () {
                      handleSubmit(widget.userId, _nameController.text,
                          _jobController.text);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
