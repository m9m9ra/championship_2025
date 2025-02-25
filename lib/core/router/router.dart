import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/layers/presentation/screens/build_screen.dart';
import 'package:matule/layers/presentation/screens/catalog_screen.dart';
import 'package:matule/layers/presentation/screens/favorite_screen.dart';
import 'package:matule/layers/presentation/screens/home_screen.dart';
import 'package:matule/layers/presentation/screens/notifivation_screen.dart';
import 'package:matule/layers/presentation/screens/popular_screen.dart';
import 'package:matule/layers/presentation/screens/profile_screen.dart';
import 'package:matule/layers/presentation/screens/signin_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RouterConfigGo {
  final _rootNavigationKey = GlobalKey<NavigatorState>();
  bool isInit = false;
  final supabase = Supabase.instance.client;

  GoRouter get router => GoRouter(
          initialLocation: "/signin",
          redirect: (context, state) {
            // supabase.auth.signOut();
            // print(supabase.auth.currentUser);
            print(isInit);
            if (!isInit) {
              print('initing...');
              isInit = true;
              if (supabase.auth.currentUser != null) {
                return "/profile";
                return "/";
              }
            }
            // return '/favorite';
            // return null;
          },
          navigatorKey: _rootNavigationKey,
          routes: [
            StatefulShellRoute.indexedStack(
                parentNavigatorKey: _rootNavigationKey,
                builder: (context, state, navigationShell) => BuildScreen(
                      child: navigationShell,
                    ),
                branches: [
                  StatefulShellBranch(routes: [
                    // ignore: prefer_const_constructors
                    GoRoute(
                      path: '/',
                      builder: (context, state) => const HomeScreen(),
                    ),
                  ]),
                  StatefulShellBranch(routes: [
                    // ignore: prefer_const_constructors
                    GoRoute(
                        path: '/favorite',
                        builder: (context, state) => const FavoriteScreen()),
                  ]),
                  StatefulShellBranch(routes: [
                    // ignore: prefer_const_constructors
                    GoRoute(
                        path: '/notification',
                        builder: (context, state) => const NotifivationScreen()),
                  ]),
                  StatefulShellBranch(routes: [
                    // ignore: prefer_const_constructors
                    GoRoute(
                        path: '/profile',
                        builder: (context, state) => const ProfileScreen()),
                  ]),
                ]),
            GoRoute(
                parentNavigatorKey: _rootNavigationKey,
                path: '/catalog',
                builder: (context, state) => const CatalogScreen()),
            GoRoute(
                path: '/popular',
                builder: (context, state) => const PopularScreen()),
            GoRoute(
                path: '/signin', builder: (context, state) => SigninScreen())
          ]);
}
