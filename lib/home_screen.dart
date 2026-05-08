import 'package:flutter/material.dart';
import 'task_model.dart';
import 'task_tile.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<TaskModel> tasks = [];

  Future<void> openAddTaskScreen() async {

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AddTaskScreen(),
      ),
    );

    if (result != null && result.toString().trim().isNotEmpty) {

      setState(() {

        tasks.insert(
          0,
          TaskModel(title: result),
        );

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xffF5F5F5),

      appBar: AppBar(
        title: const Text("Мои задачи"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: tasks.isEmpty
            ? const Center(
                child: Text(
                  "Задач пока нет",
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskTile(task: tasks[index]);
                },
              ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: openAddTaskScreen,
        backgroundColor: Colors.deepPurple,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}