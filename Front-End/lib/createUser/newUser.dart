import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todolist/createUser/new_user_bloc.dart';
import 'package:flutter_todolist/pages/FormConnect/loginBloc/login_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

Color fondForm =
const Color.fromARGB(166, 197, 197, 197); // RGBA (255, 255, 255, 0.5)

class CreateUserForm extends StatefulWidget {
  const CreateUserForm({super.key});

  @override
  State<CreateUserForm> createState() => _CreateUserFormrState();
}

class _CreateUserFormrState extends State<CreateUserForm> {
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
            IHaveAccount(),
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
        margin: const EdgeInsets.only(top: 50),
        child: const Column(
          children: [
            Text(
              "List Your",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              "Success",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 70,
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

  final TextEditingController _controllerNewFirstname = TextEditingController();
  final TextEditingController _controllerNewLastname = TextEditingController();
  final TextEditingController _controllerNewEmail = TextEditingController();
  final TextEditingController _controllerNewPwd = TextEditingController();
  final TextEditingController _controllerNewPseudo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Expanded(child: Container(
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
                        child: TextFormField(
                          controller: _controllerNewLastname,
                          cursorColor: Colors.black12,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 22),
                          decoration: const InputDecoration(
                            label: Text("Nom",
                            style:TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              ),
                            ),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez rentrer un mail Valide';
                            } if (emailRegEx.hasMatch(value)== false){
                              return 'Veuillez rentrer un mail Valide';
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 54,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.3),
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          obscureText: true,
                          controller: _controllerNewFirstname,
                          cursorColor: Colors.black12,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 22),
                          decoration: const InputDecoration(
                            label: Text("Prénom",
                              style:TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez rentrer votre mot de passe';
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 54,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.3),
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          obscureText: true,
                          controller: _controllerNewEmail,
                          cursorColor: Colors.black12,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 22),
                          decoration: const InputDecoration(
                            label: Text("Mail",
                              style:TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez rentrer votre mot de passe';
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 54,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.3),
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          obscureText: true,
                          controller: _controllerNewPwd,
                          cursorColor: Colors.black12,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 22),
                          decoration: const InputDecoration(
                            label: Text("Mdp",
                              style:TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez rentrer votre mot de passe';
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 54,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.3),
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          obscureText: true,
                          controller: _controllerNewPseudo,
                          cursorColor: Colors.black12,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 22),
                          decoration: const InputDecoration(
                            label: Text("Pseudo",
                              style:TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez rentrer votre mot de passe';
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                    BlocListener<NewUserBloc,NewUserState>(
                        listener: (context,state) {
                          if(state is NewUserAdded){
                            context.go('/login');
                          } else if (state is NewUserNotAdded){
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("Un problème est survenu, veuillez nous contacter"),
                            ));
                          }
                        },
                        child : BlocBuilder<NewUserBloc, NewUserState>(
                            builder: (context, state) =>
                                InkWell(
                                    onTap: (){

                                    },
                                      child: Text("Créer mon compte",
                                        style:TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                        ),
                                    )
                                )
                        )
                    ),
                    ]),
                  ),
                )
            )
        )
        ),
    );
  }
}

class IHaveAccount extends StatelessWidget {
  const IHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.go('/login');
      },
      child: const Text("Jai déja un compte",
          style:TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
      )
    );
  }
}
