import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sbbu_class/Screen/second_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  //initializing DIo library
  //Dio() is library(initializing)

  Dio dio = Dio();
//Varaiables and functions area

  List studentsInfo = [];
  List products = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      studentsInfo = data["studentsInfo"];
    });
  }

  Future<void> getAPIcall() async {
    var url = Uri.parse('https://dummyjson.com/product');
    var response = await http.get(url);
    var data = await json.decode(response.body);
    setState(() {
      products = data['products'];
    });
  }

  Future<void> getAPIcallDio() async {
    var url = 'https://dummyjson.com/products';
    try {
      var response = await dio.get(url);
      // var data = await json.decode(response.data);
      setState(() {
        products = response.data['products'];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    //readjason
    //getAPIcall();
    getAPIcallDio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            'Test',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: products.isEmpty
            ? //if condition
            const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                //:else
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: [
                    GestureDetector(
                      /* onTap: () {
                  //Navigation from one screen to another

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(
                        studentsInfo[index]['id'],
                        studentsInfo[index]['name'],
                        studentsInfo[index]['fatherName'],
                        studentsInfo[index]['dept'],
                        studentsInfo[index]['description'],
                      ),
                    ),
                  );
                },*/
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.black,
                          child:CachedNetworkImage(
                          imageUrl:'${products[index]['thumbnail']}',
                          placeholder: (context, url) => const CircularProgressIndicator()),
                          // Image.network(products[index]['thumbnail']),
                           ),

                        
                        title: Text(
                          '${products[index]['title']}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${products[index]['brand']}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                    ),
                    /*Container(
                color: Colors.green,
                height: 30,
                width: MediaQuery.of(context).size.width,
              ),*/
                    //const Divider(
                    //thickness: 2,
                    //color: Colors.black,
                    //),
                  ]);
                },
              ));
  }
}

