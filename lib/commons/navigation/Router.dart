// private navigators
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:riciclo_zen/city/presentation/CItyList.dart';
import 'package:riciclo_zen/commons/presentation/screens/MainScreen.dart';
import 'package:riciclo_zen/infos/presentation/InfosList.dart';
import 'package:riciclo_zen/items/presentation/ItemsList.dart';
import 'package:riciclo_zen/openweb/presentation/WebScreen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorItemsKey = GlobalKey<NavigatorState>(debugLabel: 'shellItems');
final _shellNavigatoCityKey = GlobalKey<NavigatorState>(debugLabel: 'shellCity');
final _shellNavigatoInfoKey = GlobalKey<NavigatorState>(debugLabel: 'shellInfo');
final _shellNavigatoWebKey = GlobalKey<NavigatorState>(debugLabel: 'shellWeb');

const ROUTE_ITEMS = "/";
const ROUTE_CITY = "/city";
const ROUTE_INFOS = "/infos";
const ROUTE_WEB = "/web";

// the one and only GoRouter instance
final goRouter = GoRouter(
  initialLocation: ROUTE_ITEMS,
  navigatorKey: _rootNavigatorKey,
  routes: [
    // Stateful nested navigation based on:
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return MainScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorItemsKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: ROUTE_ITEMS,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ItemsList(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatoCityKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: ROUTE_CITY,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: CityList(),
              ),
              routes: [
                GoRoute(
                  path: ROUTE_WEB,
                    builder: (BuildContext context, GoRouterState state) {
                      return const WebScreen();
                    },
                  )
              ]
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatoInfoKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: ROUTE_INFOS,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: InfosList(),
              ),
              routes:[
                GoRoute(
                  path: ROUTE_WEB,
                  builder: (BuildContext context, GoRouterState state) {
                    return const WebScreen();
                  },
                ),
              ]

            ),
          ],
        ),
      ],
    ),
  ],
);

class ScaffoldWithNestedNavigation {
}