import 'dart:io';

import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen(this.id,this.name,this.fathername, this.dept, this.description, {super.key});
  final int id;
  final String name;
  
 final String fathername;
 final String dept;
 final String description;

  @override
  State<SecondScreen> createState() => _SecondScreenState(this.id,this.name,this.fathername,this.dept,this.description,);
}

class _SecondScreenState extends State<SecondScreen> {
   _SecondScreenState(this.id,this.name,this.fathername, this.dept, this.description,);
  final int id;
  final String name;
  
 final String fathername;
 final String dept;
 final String description;
 Widget textWidget(String content)
{
 return Text(
            content,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,


            ),
            );

}
 @override
 void initstate(){
  super.initState();
  print('id=$id');
  print('name=$name');
  print('fathername=$fathername');
  print('dept=$dept');
  print('description=$description');





 }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$id'),


      ),
      body: Column(
       children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            textWidget(name),
            textWidget(fathername),
          ]
        ),
        const SizedBox(height: 50,),
        textWidget(dept),
        const SizedBox(height: 50,),
       textWidget(description),
       ], 
      ),
    ); 
  }
}