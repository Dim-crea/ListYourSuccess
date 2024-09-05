import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todolist/createUser/newUser.dart';
import 'package:flutter_todolist/createUser/new_user_bloc.dart';
import 'package:flutter_todolist/pages/FormConnect/AuthLoadPage.dart';
import 'package:flutter_todolist/pages/FormConnect/loginBloc/auth_bloc.dart';
import 'package:flutter_todolist/pages/FormConnect/LoginEvent/auth_event.dart';
import 'package:flutter_todolist/pages/FormConnect/loginBloc/login_bloc.dart';
import 'pages/FormConnect/loginPage.dart';
import 'dashboard/todopage.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

Color fondForm = const Color.fromARGB(166, 197, 197, 197); // RGBA (255, 255, 255, 0.5)


void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: '/login',
          builder: (BuildContext context, GoRouterState state) {
            return const AuthLoad();
          }
      ),
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginForm();
        }
      ),
      GoRoute(
          path: '/dashboard',
          builder: (BuildContext context, GoRouterState state) {
            return const ToDoPage();
          }
      ),
      GoRoute(
          path: '/newUser',
          builder: (BuildContext context, GoRouterState state) {
            return const CreateUserForm();
          }
      ),

    ]
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context)=> LoginBloc()),
          BlocProvider(
              create: (context) => AuthBloc()..add(AppStarted()),
          ),
          BlocProvider(
            create: (context) => NewUserBloc(),
          )
        ],
        child: MaterialApp.router(
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
        title: 'List Your Successs',
        theme: ThemeData(
          fontFamily: "LeagueGothic",
          useMaterial3: true,
        ),

    )
    );
  }
}


