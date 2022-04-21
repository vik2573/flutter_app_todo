import 'package:flutter/material.dart';
// import 'package:flutter_app_todo/cubits/active_todo_count/active_todo_count_cubit.dart';
import 'package:flutter_app_todo/pages/todos_pages/create_todo.dart';
import 'package:flutter_app_todo/pages/todos_pages/search_and_filter_todo.dart';
import 'package:flutter_app_todo/pages/todos_pages/show_todo.dart';
import 'package:flutter_app_todo/pages/todos_pages/todo_header.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 40.0,
          ),
          child: Column(
            children: [
              TodoHeader(),
              CreateTodo(),
              SizedBox(height: 20.0),
              SearchAndFilterTodo(),
              ShowTodos(),
            ],
          ),
        ),
      )),
    );
  }
}
