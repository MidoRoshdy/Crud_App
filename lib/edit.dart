
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Edit extends StatefulWidget {
  const Edit({
    super.key, required this.id
  }) ;
  final int id;

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final _titleController = TextEditingController();

  Future<void> updatePost(int id) async {
    final response = await http.put(
      Uri.parse('https://dummyjson.com/posts/$id'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'title': _titleController.text,
      }),
    );

    if (response.statusCode == 200) {
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
      body: Padding(padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _titleController ,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          const SizedBox(height: 20),
           ElevatedButton(
                onPressed: () {
                  updatePost(widget.id);
                },
          child: const Text('Update Post'),)
        ],
      ),
      )
    );}}
      