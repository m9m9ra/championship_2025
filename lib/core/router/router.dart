import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/layers/presentation/screens/build_screen.dart';
import 'package:matule/layers/presentation/screens/home_screen.dart';
import 'package:matule/layers/presentation/screens/signin_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RouterConfigGo {
  final _rootNavigationKey = GlobalKey<NavigatorState>();

  GoRouter get router => GoRouter(
    initialLocation: "/signin",
    redirect: (context, state) {
      final supabase = Supabase.instance.client;
      // supabase.auth.signOut();
      print(supabase.auth.currentUser);
      if (supabase.auth.currentUser != null) {
        return "/";
      }
      return null;
    },
    navigatorKey: _rootNavigationKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => BuildScreen(child: navigationShell,),
        branches: [
          StatefulShellBranch(routes: [
            // ignore: prefer_const_constructors
            GoRoute(path: '/', builder: (context, state) =>  HomeScreen(),)
          ])
        ]),
        GoRoute(path: '/signin', builder: (context, state) => SigninScreen())
    ]
  );
}