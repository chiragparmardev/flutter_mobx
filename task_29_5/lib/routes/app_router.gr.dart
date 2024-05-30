// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:task_29_5/ui/login_screen.dart' as _i1;
import 'package:task_29_5/ui/manage_user_screen.dart' as _i2;
import 'package:task_29_5/ui/register_screen.dart' as _i3;
import 'package:task_29_5/ui/splace_screen.dart' as _i4;
import 'package:task_29_5/ui/user_screen.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginScreen(),
      );
    },
    ManageUserRoute.name: (routeData) {
      final args = routeData.argsAs<ManageUserRouteArgs>(
          orElse: () => const ManageUserRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ManageUserScreen(
          key: args.key,
          userId: args.userId,
          name: args.name,
          job: args.job,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.RegisterScreen(),
      );
    },
    SplaceRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplaceScreen(),
      );
    },
    UserRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.UserScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ManageUserScreen]
class ManageUserRoute extends _i6.PageRouteInfo<ManageUserRouteArgs> {
  ManageUserRoute({
    _i7.Key? key,
    int? userId,
    String? name,
    String? job,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ManageUserRoute.name,
          args: ManageUserRouteArgs(
            key: key,
            userId: userId,
            name: name,
            job: job,
          ),
          initialChildren: children,
        );

  static const String name = 'ManageUserRoute';

  static const _i6.PageInfo<ManageUserRouteArgs> page =
      _i6.PageInfo<ManageUserRouteArgs>(name);
}

class ManageUserRouteArgs {
  const ManageUserRouteArgs({
    this.key,
    this.userId,
    this.name,
    this.job,
  });

  final _i7.Key? key;

  final int? userId;

  final String? name;

  final String? job;

  @override
  String toString() {
    return 'ManageUserRouteArgs{key: $key, userId: $userId, name: $name, job: $job}';
  }
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterRoute extends _i6.PageRouteInfo<void> {
  const RegisterRoute({List<_i6.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplaceScreen]
class SplaceRoute extends _i6.PageRouteInfo<void> {
  const SplaceRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplaceRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplaceRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.UserScreen]
class UserRoute extends _i6.PageRouteInfo<void> {
  const UserRoute({List<_i6.PageRouteInfo>? children})
      : super(
          UserRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
