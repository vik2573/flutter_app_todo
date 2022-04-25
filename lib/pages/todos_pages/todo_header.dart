import 'package:flutter/material.dart';
import 'package:flutter_app_todo/cubits/active_todo_count/active_todo_count_cubit.dart';
import 'package:flutter_app_todo/cubits/todo_list/todo_list_cubit.dart';
import 'package:flutter_app_todo/models/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'TODO',
          style: TextStyle(fontSize: 40.0),
        ),
        // BlocListener<TodoListCubit, TodoListState>(
        //   listener: (context, state) {
        //     final int activeTodoCount = state.todos
        //         .where((Todo todo) => !todo.completed)
        //         .toList()
        //         .length;
        //     context
        //         .read<ActiveTodoCountCubit>()
        //         .calculateActiveTodoCount(activeTodoCount);
        //   },
        // child:
        BlocBuilder<ActiveTodoCountCubit, ActiveTodoCountState>(
          builder: (context, state) {
            return Text(
              '${state.activeTodoCount} itemleft',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.redAccent,
              ),
            );
          },
        ),
        // ),
        // Text(
        //   '${context.watch<ActiveTodoCountCubit>().state.activeTodoCount} itemleft',
        //   style: TextStyle(
        //     fontSize: 20.0,
        //     color: Colors.redAccent,
        //   ),
        // ),
      ],
    );
  }
}
