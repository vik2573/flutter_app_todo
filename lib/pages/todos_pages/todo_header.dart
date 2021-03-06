import 'package:flutter/material.dart';

import 'package:flutter_app_todo/blocs/blocs.dart';
import 'package:flutter_app_todo/models/todo_model.dart';
// import 'package:flutter_app_todo/models/todo_model.dart';
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
        BlocListener<TodoListBloc, TodoListState>(
          listener: (context, state) {
            final int activeTodoCount = state.todos
                .where((Todo todo) => !todo.completed)
                .toList()
                .length;
            context.read<ActiveTodoCountBloc>().add(
                CalculateActiveTodoCountEvent(
                    activeTodoCount: activeTodoCount));
          },
          child: BlocBuilder<ActiveTodoCountBloc, ActiveTodoCountState>(
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
        ),
      ],
    );
  }
}
