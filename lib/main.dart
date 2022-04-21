import 'package:flutter/material.dart';
import 'package:flutter_app_todo/cubits/active_todo_count/active_todo_count_cubit.dart';
import 'package:flutter_app_todo/cubits/filtered_todos/filtered_todos_cubit.dart';
import 'package:flutter_app_todo/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:flutter_app_todo/cubits/todo_list/todo_list_cubit.dart';
import 'package:flutter_app_todo/cubits/todo_search/todo_search_cubit.dart';
import 'package:flutter_app_todo/pages/todos_pages/todos_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoFilterCubit>(
          create: (context) => TodoFilterCubit(),
        ),
        BlocProvider<TodoSearchCubit>(
          create: (context) => TodoSearchCubit(),
        ),
        BlocProvider<TodoListCubit>(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider<ActiveTodoCountCubit>(
          create: (context) => ActiveTodoCountCubit(
            initialActiveTodoCount:
                context.read<TodoListCubit>().state.todos.length,
          ),
        ),
        BlocProvider<FilteredTodosCubit>(
          create: (context) => FilteredTodosCubit(
            initialTodos: context.read<TodoListCubit>().state.todos,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'TODO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TodosPage(),
      ),
    );
  }
}
