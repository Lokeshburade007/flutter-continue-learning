import 'dart:convert';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage>{

  Future<Map<String,dynamic>> fetchDataFromApi() async{
    final response = await http
        .get(Uri.parse('https://official-joke-api.appspot.com...'));
        if(response.statusCode == 200) {
          final data = json.decode(response.body);
          return data;
        }else{
          throw Exception('Failed to fetch a random joke');
        }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Joke'),
        centerTitle: true,
      ),
      
      body: FutureBuilder(
          future: fetchDataFromApi(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            if(snapshot.hasData){
              final joke = snapshot.data;
              final setup = joke!['setup'];
              final punchLine = joke['punchline'];

              return Column (
                children:[
                  FlipCard(
                    front: Text('$setup'),
                    back: Text('$punchLine'),
                  )
                ],
              );
            }else{
              return const CircularProgressIndicator();
            }
          },
      )
    );
  }
}

