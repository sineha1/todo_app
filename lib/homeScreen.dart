import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_list.dart';

class Homescreen extends StatefulWidget {
   Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final _controller = TextEditingController();
  List toDoList = [
   ['Check emails', false],
   ['Plan tasks for tomorrow', false],
   ['Complete 1 mini project today', false],

  ];

  void checkBoxChanged(int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void savedNewTask(){
    setState(() {
      toDoList.add([_controller.text,false]);
      _controller.clear();
    });
  }

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade400,
      appBar: AppBar(
        title: Text("ToDo List"),
        centerTitle: true,
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        ),
        body:ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context,index){
          return TodoList(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(index),
            deleteFunction:(context) => deleteTask(index),
          );
        }) ,
        floatingActionButton: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Add a new task',
                    hintStyle: TextStyle (
                      color: Colors.white,
                    ),
                    filled: true,
                    fillColor: Colors.brown.shade200,
                    enabledBorder: OutlineInputBorder(
                      
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    )
                  ),
                ),
              )
              ),
            FloatingActionButton(
              onPressed: savedNewTask,
              child: Icon(Icons.add),
              backgroundColor: Colors.brown.shade200,
              foregroundColor: Colors.white,
              ),
          ],
        ),
    );
  }
}