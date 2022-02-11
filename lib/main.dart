import 'package:flutter/material.dart';
import 'package:flutter_go_router_demo/menu.dart';
import 'package:flutter_go_router_demo/screens/home_screen.dart';
import 'package:flutter_go_router_demo/screens/list_screen.dart';
import 'package:flutter_go_router_demo/screens/details_screen.dart';
import 'package:flutter_go_router_demo/screens/login_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class LoginInfo extends ChangeNotifier {
  var _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }
}

final loginInfo = LoginInfo();

Future<bool> getIsLoggedIn() async {
  final prefs = await SharedPreferences.getInstance();
  bool value = prefs.getBool(prefsIsLoggedIn) ?? false;
  return value;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  loginInfo.isLoggedIn = await getIsLoggedIn();

  MyItem _itemFrom(String id) {
    return itemsList.where((item) => item.id.toString() == id).first;
  }

  final _router = GoRouter(
    redirect: (state) {
      final loggedIn = loginInfo.isLoggedIn;
      final isLogging = state.location == '/${LoginScreen.name}';

      //check just the subloc in case there are query parameteres
      final goingToLogin = state.subloc == '/${LoginScreen.name}';
      //the user is not logged in and not headed to /login, they need to login
      if (!loggedIn && !goingToLogin) return '/${LoginScreen.name}?from=${state.subloc}';

      if (!loggedIn && !isLogging) return '/${LoginScreen.name}';

      if (loggedIn && isLogging) return '/';
      return null;
    },
    refreshListenable: loginInfo,
    urlPathStrategy: UrlPathStrategy.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: HomeScreen.name,
        path: '/',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        name: LoginScreen.name,
        path: '/${LoginScreen.name}',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        name: ListScreen.name,
        path: '/${ListScreen.name}',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const ListScreen(),
        ),

        routes: [
          GoRoute(
            name: DetailsScreen.name,
            path: ':id',
            pageBuilder: (context, state) {
              final item = _itemFrom(state.params['id']!);
              return MaterialPage(
                key: state.pageKey,
                child: DetailsScreen(myItem: item),
              );
            }
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    ),
  );

  runApp(
      MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
      )
  );

}

