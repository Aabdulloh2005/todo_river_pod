// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:todo_river_pod/controllers/todo_provider.dart';
// import 'package:todo_river_pod/models/todo_model.dart';

// class TodoListScreen extends ConsumerWidget {
//   const TodoListScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final todos = ref.watch(todosProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Todo List'),
//       ),
//       body: ListView.builder(
//         itemCount: todos.length,
//         itemBuilder: (context, index) {
//           final todo = todos[index];
//           return ListTile(
//             title: Text(todo.title),
//             subtitle: Text(todo.description),
//             trailing: Checkbox(
//               value: todo.isCompleted,
//               onChanged: (bool? value) {
//                 if (value != null) {
//                   ref.read(todosProvider.notifier).updateTodo(
//                         todo.copyWith(isCompleted: value),
//                       );
//                 }
//               },
//             ),
//             onLongPress: () {
//               ref.read(todosProvider.notifier).deleteTodo(todo.id!);
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _showAddTodoDialog(context, ref),
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   void _showAddTodoDialog(BuildContext context, WidgetRef ref) {
//     final titleController = TextEditingController();
//     final descriptionController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Add Todo'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               controller: titleController,
//               decoration: const InputDecoration(labelText: 'Title'),
//             ),
//             TextField(
//               controller: descriptionController,
//               decoration: const InputDecoration(labelText: 'Description'),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               final newTodo = Todo(
//                 title: titleController.text,
//                 description: descriptionController.text,
//               );
//               ref.read(todosProvider.notifier).addTodo(newTodo);
//               Navigator.pop(context);
//             },
//             child: const Text('Add'),
//           ),
//         ],
//       ),
//     );
//   }
// }