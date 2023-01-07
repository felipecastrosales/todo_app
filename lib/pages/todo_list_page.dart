import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/repositories/todo_repository.dart';
import 'package:todo_app/widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TodoRepository todoRepository = TodoRepository();
  final TextEditingController todoController = TextEditingController();
  final List<Todo> todos = [];

  Todo? deletedTodo;
  int? deletedTodoIndex;
  String? errorText;

  @override
  void initState() {
    super.initState();
    todoRepository.getTodoList().then((List<Todo> value) {
      setState(() {
        value = todos;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: todoController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Add a new ToDo',
                          hintText: 'Enter a ToDo',
                          errorText: errorText,
                          labelStyle: const TextStyle(
                            color: Color(0xFFFF0000),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFF0000),
                              width: 2,
                            ),
                          ),
                        ),
                        onSubmitted: (String text) {
                          addTodo;
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: addTodo,
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        backgroundColor: const Color(0xFFFF0000),
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
                    reverse: true,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    children: [
                      for (Todo todo in todos)
                        TodoListItem(
                          todo: todo,
                          onDelete: (Todo todo) {
                            onDelete(todo);
                          },
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'You have ${todos.length} pending Todo',
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: showDeleteTodosConfirmationDialog,
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
      ),
    );
  }

  void onDelete(Todo todo) {
    deletedTodo = todo;
    deletedTodoIndex = todos.indexOf(todo);

    setState(() {
      todos.remove(todo);
    });
    todoRepository.saveTodoList(todos);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.white,
        content: Text(
          "ToDo '${todo.title}' deleted",
          style: TextStyle(
            color: Colors.grey[800],
          ),
        ),
        action: SnackBarAction(
          label: 'Undo',
          textColor: const Color(0xFFFF0000),
          onPressed: () {
            todos.insert(
              deletedTodoIndex as int,
              deletedTodo as Todo,
            );
            setState(() {
              todoRepository.saveTodoList(todos);
            });
          },
        ),
      ),
    );
  }

  void showDeleteTodosConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Clear All'),
          content: const Text('Are you sure you want to clear all ToDos?'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey[800],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                deleteAllTodos();
              },
              child: const Text(
                'Clear',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void deleteAllTodos() {
    setState(() {
      todos.clear();
    });
    todoRepository.saveTodoList(todos);
  }

  void addTodo() {
    String text = todoController.text;
    if (text.isEmpty) {
      setState(() {
        errorText = 'Please enter a ToDo';
      });
      return;
    }
    setState(() {
      todos.add(
        Todo(
          title: text,
          dateTime: DateTime.now(),
        ),
      );
      errorText = null;
    });
    todoController.clear();
    todoRepository.saveTodoList(todos);
  }
}
