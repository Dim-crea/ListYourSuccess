import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: const AppBarToDo(),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/FondtodoList.png'),
              fit: BoxFit.cover
          ),
        ),
        child: const Column(
          children: [
            AppBarToDo(),
            Listtodo(),
            ListItemTache(),
          ],
        ),
      ),

    );
  }
}

class AppBarToDo extends StatelessWidget {

  const AppBarToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/LogoListYourSuccess.png',
          ),
        ],
      ),
    );
  }
}

class Listtodo extends StatefulWidget {
  const Listtodo({super.key});

  @override
  ListtodoState createState() {
    return ListtodoState();
  }
}

class ListtodoState extends State<Listtodo> {
  final _formkeyListTodo = GlobalKey<ListtodoState>();
  final List<String> listMenu = [
    'Tâches',
    'Professionnelle',
    'Course',
    'Administratif'
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listMenu.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      listMenu[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),

                );
              },
            ),
          ),
        ),
        Image.asset(
          "assets/icons/Slider.png",
          height: 70,
          width: 70,
        ),
      ],


    );
  }
}

class CardModel extends StatefulWidget {
  const CardModel({super.key});

  @override
  State<CardModel> createState() => _CardModelState();
}

class _CardModelState extends State<CardModel> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Expanded(
        child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10,left: 15),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Colors.white60, Colors.white10],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const Column(
                children:  [
                  Text('',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      )
                  ),
                  Text("data",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      )
                  ),
                ],
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  height: 50,
                  width: 50,

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class ListItemTache extends StatefulWidget {
  const ListItemTache({super.key});


  @override
  State<ListItemTache> createState() => _ListItemState();
}

class _ListItemState extends State<ListItemTache> {


  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric( vertical: 5),
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.white60, Colors.white10],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      )
                  ),
                  child: Column(
                    children: [
                       const Text("Tache",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          )),
                      SingleChildScrollView(
                      child: Column(
                        children: [
                        Card(
                        color: Colors.transparent,
                        child: Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(top: 10, bottom: 10,left: 15),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [Colors.white60, Colors.white10],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                const Column(
                                  children:  [
                                    Text('',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                        )
                                    ),
                                    Text("data",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                        )
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: (){},
                                  child: Container(
                                    height: 50,
                                    width: 50,

                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                          ],
                    ),
                  ),
                ]),
                )
              ),
              ),
            ),
    );

  }
}

class ListItemPro extends StatefulWidget {
  const ListItemPro({super.key});

  @override
  State<ListItemPro> createState() => _ListItemProState();
}

class _ListItemProState extends State<ListItemPro> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.white60, Colors.white10],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight
                    )
                ),

              ),
            ),
          ),
        )
    );
  }
}



