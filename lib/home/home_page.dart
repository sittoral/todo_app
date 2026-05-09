import 'package:flutter/material.dart';
import '../add/add_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> tasks = [];

  Future<void> goToAddPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddPage()),
    );

    if (result != null && result.toString().trim().isNotEmpty) {
      setState(() {
        tasks.insert(0, result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Мои задачи"),
        centerTitle: true,
      ),

      body: tasks.isEmpty
          ? const Center(
              child: Text("Задач пока нет"),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.task),
                  title: Text(tasks[index]),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: goToAddPage,
        child: const Icon(Icons.add),
      ),
    );
  }
}