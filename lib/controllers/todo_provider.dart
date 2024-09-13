// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:todo_river_pod/models/todo_model.dart';
// import 'package:todo_river_pod/service/todo_service.dart';

// final todoRepositoryProvider = Provider<TodoRepository>((ref) => TodoRepository());

// final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
//   final repository = ref.watch(todoRepositoryProvider);
//   return TodosNotifier(repository);
// });

// class TodosNotifier extends StateNotifier<List<Todo>> {
//   final TodoRepository _repository;

//   TodosNotifier(this._repository) : super([]) {
//     _init();
//   }

//   Future<void> _init() async {
//     await _repository.initDatabase();
//     state = await _repository.getLocalTodos();
//     _fetchTodos();
//   }

//   Future<void> _fetchTodos() async {
//     final todos = await _repository.fetchTodos();
//     state = todos;
//   }

//   Future<void> addTodo(Todo todo) async {
//     await _repository.addTodo(todo);
//     _fetchTodos();
//   }

//   Future<void> updateTodo(Todo todo) async {
//     await _repository.updateTodo(todo);
//     _fetchTodos();
//   }

//   Future<void> deleteTodo(String id) async {
//     await _repository.deleteTodo(id);
//     _fetchTodos();
//   }
// }