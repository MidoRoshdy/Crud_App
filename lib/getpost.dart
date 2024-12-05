
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


class Getpost extends StatefulWidget {
  const Getpost({
super.key,    
required this.id
    
  });

 final int id;

  @override
  State<Getpost> createState() => _GetpostState();
}



class _GetpostState extends State<Getpost> {
  Map<String, dynamic> singlepost = {};
  @override
  void initState() {
    getallposts(widget.id);
    super.initState();
  }

  void getallposts (int id)async{
    var url= Uri.parse('https://dummyjson.com/posts/$id');
    final response= await http.get(url)    ;
    if(response.statusCode==200){
      setState(() {
        singlepost=json.decode(response.body );
      }
      
      );
      
    

  }
  else {
      throw Exception('Failed to load post');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 224, 222, 222),
        title: const Text('Single Post',
          style:  TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: singlepost.isEmpty? const Center(
      child:   CircularProgressIndicator(),

    ): Padding(padding: const EdgeInsets.all(20),child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(singlepost['title']??'',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        const SizedBox(height: 20,),
        Text(
              singlepost['body'] ?? 'No content available',
              style: const TextStyle(fontSize: 17, ),
                  ),
                  
      ],
    ),),



    );
    
    }
    }
      