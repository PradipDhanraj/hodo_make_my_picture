import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hod_makemypicture/src/modules/game/pages/game_page.dart';
import 'package:hod_makemypicture/src/modules/game/pages/game_page1.dart';

GoRouter get router => _router;

final GoRouter _router = GoRouter(
  initialLocation: '/game',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const GamePage1();
      },
      routes: <RouteBase>[
        // GoRoute(
        //   path: 'game',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const GamePage(title: 'Game');
        //   },
        // ),
      ],
    ),
    GoRoute(
      path: '/game',
      builder: (BuildContext context, GoRouterState state) {
        return const GamePage(title: 'Game');
      },
      routes: <RouteBase>[
        // GoRoute(
        //   path: 'game',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const GamePage(title: 'Game');
        //   },
        // ),
      ],
    ),
  ],
);
