import 'package:flutter/material.dart';
import 'package:my_first_app/add_todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيق قائمة المهام',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ToDoListScreen(),
    );
  }
}

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  List<String> toDos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قائمة المهام'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              setState(() {
                toDos.clear();
              });
            }

          )
        ]
      ),
        body: toDos.isEmpty
        ? const Center(
          child: Text('لا يوجد مهام حاليا'),
        )
        : ListView.builder(
            itemCount: toDos.length,
        itemBuilder: (context,index){
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: const Icon(Icons.check_circle_outline),
                  title: Text(toDos[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        toDos.removeAt(index);
                      });
                    }
                  ),
                ),
              );
        },
        ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async{
            final result = await Navigator.push(
              context,
            MaterialPageRoute(builder: (context) => const AddToDoScreen()),
            );
            if (result != null) {
              setState(() {
                toDos.add(result);
              });
            }
          },
        child: const Icon(Icons.add),
      ),
    );
  }
}