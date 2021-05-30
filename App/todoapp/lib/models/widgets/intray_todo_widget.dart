import 'package:flutter/material.dart';
import 'package:todoapp/models/global.dart';

class IntrayTodo extends StatelessWidget{
  final String title;

  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  int id = 1;
  IntrayTodo({required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 15,left: 15,right: 15),
      height: 100,
    decoration: BoxDecoration(
      color: redColor,
      borderRadius:BorderRadius.all(Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.5),
        blurRadius: 10.0,
      ),
    ]),
      child: Row(
        children: [
          Radio(
            activeColor: Colors.black38,
            value: 1,
            groupValue: id,
            onChanged: (val) {
              /*radioButtonItem = 'ONE';
              id = 1;*/
            },
          ),
          Column(
            children: [
              Text(title,style: darkTodoTitle,)
            ],
          )
    ],
    ),);
  }
  
}