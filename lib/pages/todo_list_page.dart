import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('ToDo List'),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'ToDo',
                ),
                onChanged: onChanged,
                onSubmitted: onSubmitted,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    final String email = emailController.text;
    debugPrint(email);
    emailController.text = 'Reset';
  }

  void onChanged(String text) {}

  void onSubmitted(String text) {}
}
