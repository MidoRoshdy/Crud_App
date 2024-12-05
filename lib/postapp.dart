
import 'package:flutter/material.dart';

class Postapp extends StatelessWidget {
  const Postapp({

    Key? key,
     this.dislike=0,
     this.like=0,
     this.paragraph="",
    required this.title,
     this.view=0,
     this.tags=const[],
     required this.fn

  }) : super(key: key);

  final String title;
  final String paragraph;
  final int like;
  final int dislike;
  final int view;
  final List<String> tags;
  final Function()  fn;





  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title:Text(title ,style: const TextStyle(color: Colors.black,fontSize: 15),),
      trailing:
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                bttn(onPressed: (){},icon:const Icon(Icons.delete),color: Colors.red),
                bttn(onPressed: (){},icon:const Icon(Icons.edit),color: Colors.blue),
                bttn(onPressed: (){
                  fn();

                },icon:const Icon(Icons.remove_red_eye),color: Colors.green),
                
              ],
            )
          
        
      

    );}

  IconButton bttn({required void Function()? onPressed,required Widget icon,required Color? color}) {
    return IconButton(onPressed: onPressed, icon: icon,color: color );
  }}