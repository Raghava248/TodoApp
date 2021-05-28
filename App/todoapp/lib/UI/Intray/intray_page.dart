import 'package:flutter/material.dart';
import 'package:todoapp/models/global.dart';
import 'package:todoapp/models/widgets/intray_todo_widget.dart';

class IntrayPage extends StatefulWidget {

  @override
  _IntrayPageState createState() => _IntrayPageState();
}

class _IntrayPageState extends State<IntrayPage> {
  List<IntrayTodo> todoItems = [];
  @override
  Widget build(BuildContext context) {
    return Container(

      color: darkGreyColor,
      child:ReorderableListView(
        padding: EdgeInsets.only(top: 200),
        
        children: [
          for(final items in  getList())
            Container(

              child: Card(

                color: Colors.white,
                key: ValueKey(items),

              ),
            )


        ],
        onReorder: reorderData,
      ),
    );
  }

  List<Widget> getList() {

    for(int i = 0; i < 10; i++){
      todoItems.add(IntrayTodo(keyValue: i.toString(), title: 'Hello',));

    }
    return todoItems;
  }

  void reorderData(int oldindex, int newindex){

    setState(() {
      if(newindex>oldindex){
        newindex-=1;
      }
      final items = todoItems.removeAt(oldindex);
      todoItems.insert(newindex, items);
    });
  }
}

