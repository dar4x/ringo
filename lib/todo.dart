import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final List<String> todos = [];

  void _addTodo(String e) {
    if (!e.trim().isNotEmpty) return;
    setState(() => todos.add(e.trim()));
  }

  void _deleteTodo(index) {
    setState(() => todos.removeAt(index));
  }

  void _updateTodo(int index, String newTodo) {
    if (!newTodo.trim().isNotEmpty) return;
    setState(() => todos[index] = newTodo.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                onSubmitted: (e) => _addTodo(e),
                decoration: const InputDecoration(
                  labelText: 'Add todo',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(todos[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                String updatedTodo = todos[index];
                                return AlertDialog(
                                  title: const Text('Edit todo'),
                                  content: TextField(
                                    onChanged: (e) {
                                      updatedTodo = e;
                                    },
                                    controller: TextEditingController(
                                        text: todos[index]),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        _updateTodo(index, updatedTodo);
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Save'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteTodo(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
