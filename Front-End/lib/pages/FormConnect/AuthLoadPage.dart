import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todolist/dashboard/todopage.dart';
import 'package:flutter_todolist/pages/FormConnect/loginBloc/auth_bloc.dart';
import 'package:flutter_todolist/pages/FormConnect/loginBloc/auth_state.dart';
import 'package:flutter_todolist/pages/FormConnect/loginPage.dart';
import 'package:go_router/go_router.dart';

class AuthLoad extends StatefulWidget {
  const AuthLoad({super.key});

  @override
  State<AuthLoad> createState() => _AuthLoadState();
}

class _AuthLoadState extends State<AuthLoad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              body: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/FondtodoList.png'), fit: BoxFit.cover),
                  ),
                  constraints: const BoxConstraints.expand(),
                  child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children : [
                        Text("Authentification",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white
                          ),
                        ),
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white54),
                        ) ,
                      ])
              ),
    );
  }
}

// Scaffold(
// body: Container(
// decoration: const BoxDecoration(
// image: DecorationImage(
// image: AssetImage('assets/FondtodoList.png'), fit: BoxFit.cover),
// ),
// constraints: const BoxConstraints.expand(),
// child: const Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children : [
// Text("Authentification",
// style: TextStyle(
// fontSize: 30,
// color: Colors.white
// ),
// ),
// CircularProgressIndicator(
// valueColor: AlwaysStoppedAnimation<Color>(Colors.white54),
// ) ,
// ])
// ),
// );