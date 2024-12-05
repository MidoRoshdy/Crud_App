import 'dart:convert';
import 'package:crud_app/routesname.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Getall extends StatefulWidget {
  const Getall({super.key});

  @override
  State<Getall> createState() => _GetallState();
}

class _GetallState extends State<Getall> {
  List<dynamic> posts = [];
  @override
  void initState() {
    fetchdata();

    super.initState();
  }

  void fetchdata() async {
    var url = Uri.https('dummyjson.com', 'posts');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        posts = jsonDecode(response.body)['posts'];
      });
    } else {
      throw Exception("Failed to load posts");
    }
  }

  void deletedata(int id) async {
    var url = Uri.parse('https://dummyjson.com/posts/$id');
    var response = await http.delete(url);

    if (response.statusCode == 200) {
      setState(() {
        posts.removeWhere((item) => item['id'] == id);
      });
    } else {
      throw Exception("Failed to load posts");
    }
    // Map<String, dynamic> data= jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: posts.isEmpty ? _loading() : list_posts()));
  }

  // ignore: non_constant_identifier_names
  ListView list_posts() {
    return ListView.separated(
      itemBuilder: (context, index) {
        var post = posts[index];
        return ListTile(
            title: Text(
              post['title'],
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                bttn(
                    onPressed: () {
                      setState(() {
                        deletedata(post['id']);
                      });
                    },
                    icon: const Icon(Icons.delete),
                    color: Colors.red),
                bttn(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.updatee,
                          arguments: post['id']);
                    },
                    icon: const Icon(Icons.edit),
                    color: Colors.blue),
                bttn(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.get,
                          arguments: post['id']);
                    },
                    icon: const Icon(Icons.remove_red_eye),
                    color: Colors.green),
              ],
            ));
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: posts.length,
    );
  }

  IconButton bttn(
      {required void Function()? onPressed,
      required Widget icon,
      required Color? color}) {
    return IconButton(onPressed: onPressed, icon: icon, color: color);
  }
}

Widget _loading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}
