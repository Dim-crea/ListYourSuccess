import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todolist/pages/FormConnect/loginBloc/login_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

Color fondForm =
    const Color.fromARGB(166, 197, 197, 197); // RGBA (255, 255, 255, 0.5)

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
          children: [
            AcceuilApp(),
            FormConnect(),
            SizedBox(height: 50),
            CreateAccount(),
          ],
        ),
      ),
    );
  }
}

class AcceuilApp extends StatelessWidget {
  const AcceuilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 70),
        child: const Column(
          children: [
            Text(
              "List Your",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
              ),
            ),
            Text(
              "Success",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 90,
                  fontFamily: "Island_Moments"),
            ),
          ],
        ),
      ),
    );
  }
}

class FormConnect extends StatefulWidget {
  const FormConnect({super.key});

  @override
  FormConnectState createState() {
    return FormConnectState();
  }
}

class FormConnectState extends State<FormConnect> {
  final _formkey = GlobalKey<FormState>();
  RegExp emailRegEx =
      RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  height: 300,
                  width: 370,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white60, Colors.white10]),
                      borderRadius: BorderRadius.circular(30)),
                  child: Form(
                    key: _formkey,
                    child: Column(children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.topCenter,
                        child: const Text(
                          'Me Connecter',
                          style: TextStyle(
                            fontSize: 27,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 54,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.3),
                            borderRadius: BorderRadius.circular(25)),
                        child: Semantics(
                          label: 'Champ de connexion',
                          hint: 'Rentrez votre adresse-mail',
                          child: TextFormField(
                          controller: _controllerEmail,
                          cursorColor: Colors.black12,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 22),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez rentrer un mail Valide';
                            } if (emailRegEx.hasMatch(value)== false){
                              return 'Veuillez rentrer un mail Valide';
                            }
                          },
                        ),),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 54,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.3),
                            borderRadius: BorderRadius.circular(25)),
                        child: Semantics(
                          label: 'champ de connexion',
                          hint: 'Rentrez votre mot de passe',
                          child: TextFormField(
                          obscureText: true,
                          controller: _controllerPwd,
                          cursorColor: Colors.black12,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 22),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez rentrer votre mot de passe';
                            }
                            return null;
                          },
                        ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      BlocListener<LoginBloc,LoginState>(
                          listener: (context,state){
                            if(state is LoginSuccess){
                              context.go("/todopage");
                            } else if (state is LoginFailure){
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Saisissez une adresse-mail et un mot de passe valide"),
                              ));
                            }
                          },
                        child: Semantics(
                          label: 'Bouton de connexion',
                            hint: 'Appuyer pour valider le formulaire de connexion',
                            child: BlocBuilder<LoginBloc,LoginState>(
                          builder: (context, state) =>
                              InkWell(
                                  onTap: () {
                                    if (_formkey.currentState!.validate()) {
                                      context.read<LoginBloc>().add(LoginUserEvent(
                                          email: _controllerEmail.text,
                                          password: _controllerPwd.text)
                                      );
                                    }
                                  },
                                  child: Image.asset(
                                    "assets/icons/Padlock.png",
                                  )
                              ),
                        )
                        ),
                      ),
                    ]),
                  ),
                )
            )
        )
    );
  }
}

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
        child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Semantics(
        label: 'Bouton pour créer votre compte',
        hint: 'Appuyez pour créer votre compte',
        child: Container(
          height: 80,
          width: 370,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white60, Colors.white10]),
              borderRadius: BorderRadius.circular(25)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Créer votre compte",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              Container(
                child: SvgPicture.asset(
                  'assets/icons/Forward.svg',
                  height: 30,
                  width: 30,
                  colorFilter:
                      const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
              )
            ],
          )),
    )));
  }
}
