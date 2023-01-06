import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  final List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: todoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Add a new ToDo',
                        hintText: 'Enter a ToDo',
                      ),
                      onSubmitted: (String text) {
                        setState(() {
                          todos.add(text);
                        });
                        todoController.clear();
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      String text = todoController.text;
                      setState(() {
                        todos.add(text);
                      });
                      todoController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF0000),
                      fixedSize: const Size(48, 48),
                      padding: const EdgeInsets.all(12),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (String todo in todos)
                      ListTile(
                        title: Text(
                          todo,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF000000),
                          ),
                        ),
                        onTap: () {},
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'You have 0 pending ToDo',
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF0000),
                      padding: const EdgeInsets.all(16),
                    ),
                    child: const Text(
                      'Clear All',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
