import 'package:flutter/material.dart';
import 'package:xogame/names_model.dart';
import 'package:xogame/xohome.dart';

class Names extends StatelessWidget {
  static const String routeName="playersName";

  var name1Controller = TextEditingController();

  var name2Controller = TextEditingController();

  Names({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 20),
        child: Column(
        children: [
          Text("اسماء اللاعبين",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold,)),
          SizedBox(height: 20,),
          TextFormField(
            controller: name1Controller,
            decoration: const InputDecoration(hintText: "player 1"),

          ),
          TextFormField(
            controller: name2Controller,
            decoration: const InputDecoration(hintText: "player 2"),

          ),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, XoHome.routeName,
                arguments: NamesModel(name1Controller.text,name2Controller.text)
            );
          }, child: Text("Start play"))

        ]),
      ),
    );
  }
}
