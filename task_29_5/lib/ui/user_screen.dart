// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_29_5/generated/assets.dart';
import 'package:task_29_5/routes/app_router.gr.dart';
import 'package:task_29_5/store/user/user_store.dart';
import 'package:task_29_5/values/app_color.dart';

@RoutePage()
class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    user.fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: const Text(
          "User Screen",
          style: TextStyle(
            color: AppColor.white,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    elevation: 0,
                    title: const Text(
                      "Logout",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                    ),
                    content: const Text("Are you sure you want to logout?"),
                    actions: [
                      TextButton(
                          child: const Text("Cancel"),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      TextButton(
                        child: const Text(
                          "Log out",
                          style: TextStyle(color: AppColor.red),
                        ),
                        onPressed: () async {
                          const storage = FlutterSecureStorage();
                          await storage.deleteAll();
                          context.router.replaceAll([const LoginRoute()]);
                        },
                      ),
                    ],
                  );
                });
          },
          icon: const Icon(
            Icons.power_settings_new_outlined,
            color: AppColor.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: AppColor.white,
            ),
            onPressed: () {
              context.router.push(ManageUserRoute());
            },
          ),
        ],
      ),
      body: Observer(builder: (context) {
        if (user.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (user.userFetchError != null) {
          if(user.userFetchError.toString() == '404'){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.imagesInternet,width: 200,height: 200,fit: BoxFit.contain,),
                  TextButton(onPressed: (){
                    user.fetchUser();
                  },style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(AppColor.primary)
                  ), child: const Text('Try Again',style: TextStyle(
                    color: AppColor.white,
                    fontSize: 16
                  ),),)
                ],
              ),
            );
          }
          else{
          Center(
            child: Text(user.userFetchError!),
          );
          }
        }

        if (user.userListResponseModel != null) {
          return ListView.separated(
              itemBuilder: (context, index) {
                var data = user.userListResponseModel!.data[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data.avatar),
                    radius: 25,
                    backgroundColor: AppColor.primary,
                  ),
                  title: Text('${data.firstName} ${data.lastName}'),
                  subtitle: Text(data.email),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: AppColor.primary,
                        ),
                        onPressed: () {
                          context.router.push(ManageUserRoute(
                            userId: data.id,
                            name: data.firstName,
                            job: data.lastName,
                          ));
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: AppColor.red,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  elevation: 0,
                                  title: const Text(
                                    "Delete",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25),
                                  ),
                                  content: Text(
                                      "Are you sure you want to delete ${data.firstName} ?"),
                                  actions: [
                                    TextButton(
                                        child: const Text("Cancel"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }),
                                    TextButton(
                                      child: const Text(
                                        "Delete",
                                        style: TextStyle(color: AppColor.red),
                                      ),
                                      onPressed: () async {
                                        await user.deleteUser(data.id);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: user.userListResponseModel!.data.length);
        }
        return const Center(
          child: Text('No data'),
        );
      }),
    );
  }
}
