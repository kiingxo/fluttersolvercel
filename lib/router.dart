import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:solanawallet/components/navbar.dart';
import 'package:solanawallet/pages/actavationerror.dart';
import 'package:solanawallet/pages/enter_code.dart';
import 'package:solanawallet/pages/mevbot_bot.dart';
import 'package:solanawallet/pages/recieve.dart';


final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Wrapper(); // Set Wrapper as the initial route
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'withdraw',
          builder: (BuildContext context, GoRouterState state) {
            return const ActivationErrorPage();
          },
        ),
        GoRoute(
          path: 'receive',
          builder: (BuildContext context, GoRouterState state) {
            return const RecievePage();
          },
        ),
        GoRoute(
          path: 'hold',
          builder: (BuildContext context, GoRouterState state) {
            return const EnterCodePage();
          },
        ),
        GoRoute(
          path: 'start',
          builder: (BuildContext context, GoRouterState state) {
            return const MevBotPage();
          },
        ),
        GoRoute(
          path: 'settings',
          builder: (BuildContext context, GoRouterState state) {
            return const EnterCodePage();
          },
        ),
      ],
    ),
  ],
);
