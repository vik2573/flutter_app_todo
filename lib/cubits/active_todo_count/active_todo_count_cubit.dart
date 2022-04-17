import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_app_todo/cubits/todo_list/todo_list_cubit.dart';
import 'package:flutter_app_todo/models/todo_model.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  late final StreamSubscription todoListSubscription;
  final int initialActiveTodoCount;
  final TodoListCubit todoListCubit;
  ActiveTodoCountCubit({
    required this.initialActiveTodoCount,
    required this.todoListCubit,
  }) : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount)) {
    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      print('todoListState: $todoListState');

      final int currentActiveTodoCount = todoListState.todos
          .where((Todo todo) => todo.completed)
          .toList()
          .length;

      emit(state.copyWith(activeTodoCount: currentActiveTodoCount));
    });
  }
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
