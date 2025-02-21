import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/layers/presentation/screens/build_screen.dart';
import 'package:matule/layers/presentation/screens/catalog_screen.dart';
import 'package:matule/layers/presentation/screens/home_screen.dart';
import 'package:matule/layers/presentation/screens/popular_screen.dart';
import 'package:matule/layers/presentation/screens/signin_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RouterConfigGo {
  final _rootNavigationKey = GlobalKey<NavigatorState>();
  bool isInit = false;
  final supabase = Supabase.instance.client;

  GoRouter get router => GoRouter(
          initialLocation: "/",
          redirect: (context, state) {
            // supabase.auth.signOut();
            // print(supabase.auth.currentUser);
            print(isInit);
            if (!isInit) {
              print('initing...');
              isInit = true;
              if (supabase.auth.currentUser != null) {
                // return "/catalog";
                return "/";
              }
            } 
            // return null;
          },
          navigatorKey: _rootNavigationKey,
          routes: [
            StatefulShellRoute.indexedStack(
                builder: (context, state, navigationShell) => BuildScreen(
                      child: navigationShell,
                    ),
                branches: [
                  StatefulShellBranch(routes: [
                    // ignore: prefer_const_constructors
                    GoRoute(
                        path: '/',
                        builder: (context, state) => const HomeScreen(),
                        routes: [
                          GoRoute(
                              path: 'popular',
                              builder: (context, state) =>
                                  const PopularScreen()),
                          GoRoute(
                              path: 'catalog',
                              builder: (context, state) =>
                                  const CatalogScreen()),
                        ]),
                  ]),
                ]),
            GoRoute(
                path: '/signin', builder: (context, state) => SigninScreen())
          ]);
}
