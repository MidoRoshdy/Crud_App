import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Add extends StatefulWidget {
  const Add({super.key, });
  

  @override
  State<Add> createState() => _EditState();
}

class _EditState extends State<Add> {
  final _titleController = TextEditingController();

  Future<void> addpost() async {
    final response = await http.post(
      Uri.parse('https://dummyjson.com/posts/add'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'title': _titleController.text,
        'userId': 5
      }),
    );

    if (response.statusCode == 201) {
      _titleController.clear();
      print(response.body);
    } else {
      throw Exception('Failed to update post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Update Post')),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: 20),
               ElevatedButton(
                onPressed: () {
                  addpost();
                },
                child: const Text('Create Post'),
              )
            ],
          ),
        ));
  }
}
