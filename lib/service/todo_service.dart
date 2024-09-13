// import 'package:dio/dio.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:todo_river_pod/models/todo_model.dart';

// class TodoRepository {
//   final Dio _dio = Dio(BaseOptions(
//     baseUrl: 'https://music-app-31d3f-default-rtdb.firebaseio.com/',
//   ));
//   late Database _database;

//   Future<void> initDatabase() async {
//     _database = await openDatabase(
//       join(await getDatabasesPath(), 'todo_database.db'),
//       onCreate: (db, version) {
//         return db.execute(
//           'CREATE TABLE todos(id TEXT PRIMARY KEY, title TEXT, description TEXT, isCompleted INTEGER)',
//         );
//       },
//       version: 1,
//     );
//   }

//   Future<List<Todo>> fetchTodos() async {
//     try {
//       final response = await _dio.get('todos.json');
//       final Map<String, dynamic> data = response.data;
//       final List<Todo> todos = [];
//       data.forEach((key, value) {
//         todos.add(Todo.fromJson({...value, 'id': key}));
//       });
//       return todos;
//     } catch (e) {
//       print('Error fetching todos: $e');
//       return [];
//     }
//   }

//   Future<void> addTodo(Todo todo) async {
//     try {
//       final response = await _dio.post('todos.json', data: todo.toJson());
//       final String id = response.data['name'];
//       await _database.insert(
//         'todos',
//         {...todo.toJson(), 'id': id, 'isCompleted': todo.isCompleted ? 1 : 0},
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     } catch (e) {
//       print('Error adding todo: $e');
//     }
//   }

//   Future<void> updateTodo(Todo todo) async {
//     try {
//       await _dio.put('todos/${todo.id}.json', data: todo.toJson());
//       await _database.update(
//         'todos',
//         {...todo.toJson(), 'isCompleted': todo.isCompleted ? 1 : 0},
//         where: 'id = ?',
//         whereArgs: [todo.id],
//       );
//     } catch (e) {
//       print('Error updating todo: $e');
//     }
//   }

//   Future<void> deleteTodo(String id) async {
//     try {
//       await _dio.delete('todos/$id.json');
//       await _database.delete(
//         'todos',
//         where: 'id = ?',
//         whereArgs: [id],
//       );
//     } catch (e) {
//       print('Error deleting todo: $e');
//     }
//   }

//   Future<List<Todo>> getLocalTodos() async {
//     final List<Map<String, dynamic>> maps = await _database.query('todos');
//     return List.generate(maps.length, (i) {
//       return Todo.fromJson({
//         ...maps[i],
//         'isCompleted': maps[i]['isCompleted'] == 1,
//       });
//     });
//   }
// }