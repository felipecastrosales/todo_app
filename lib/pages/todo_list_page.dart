import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

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
                // mainAxisSize: MainAxisSize.min,
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Add a new ToDo',
                        hintText: 'Enter a ToDo',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
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
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    leading: const Icon(Icons.check_box_outline_blank),
                    title: const Text('ToDo 1'),
                    subtitle: const Text('05/01/2023'),
                    trailing: const Icon(Icons.delete),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.check_box_outline_blank),
                    title: const Text('ToDo 2'),
                    subtitle: const Text('05/01/2023'),
                    trailing: const Icon(Icons.delete),
                    onTap: () {},
                  ),
                ],
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
