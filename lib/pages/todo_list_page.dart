import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({super.key});

  final TextEditingController todoController = TextEditingController();



  void deleteAllTodo() {
    //todoController.clear();
  }

  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Lista de Tarefas',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),


              SizedBox(
                height: 16,
              ),


              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: todoController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adicione uma tarefa',
                        hintText: 'Ex: Estudar Flutter',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),


                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      iconColor: Colors.white,
                      fixedSize: Size(80, 50),
                      padding: EdgeInsets.all(14),
                    ),
                    onPressed: () {
                      String text = todoController.text;
                      },
                    child: Icon(Icons.add),
                  ),
                ],
              ),


              SizedBox(height: 16),

                ListView(
                  shrinkWrap: true,
                  children: [

                    ListTile(
                      title: Text('Estudar Flutter'),
                      trailing: Icon(Icons.delete),
                      leading: Icon(Icons.check_box),
                      onTap: (){print('estudando Flutter');},
                    ),

                    ListTile(
                      title: Text('Estudar Dart'),
                      trailing: Icon(Icons.delete),
                      leading: Icon(Icons.check_box),
                      onTap: (){print('estudando Dart');},
                    ),


                    ListTile(
                      title: Text('Estudar Python'),
                      trailing: Icon(Icons.delete),
                      leading: Icon(Icons.check_box),
                      onTap: (){print('estudando Python');},
                    ),





                  ],
                ),


              SizedBox(width: 32),

              // ignore: prefer_const_constructors
              Row(
                children: [
                  Expanded(
                    child: Text('Você possui tarefas pendentes'),
                  ),
                  SizedBox(height: 200),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      iconColor: Colors.white,
                      padding: EdgeInsets.all(14),
                      fixedSize: Size(80, 50),
                    ),
                    onPressed: deleteAllTodo,
                    child: Icon(
                      Icons.delete_forever,
                    ),
                  )
                ],
              )
            ],
          ),
        )
    );
  } // Widget build

} // StatelessWidget
