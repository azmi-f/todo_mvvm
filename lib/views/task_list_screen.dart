import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/task_view_model.dart';
import 'add_task_screen.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Tugas'),
      ),
      body: ListView.builder(
        itemCount: taskViewModel.tasks.length,
        itemBuilder: (context, index) {
          final task = taskViewModel.tasks[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Checkbox(
                    value: task.isCompleted,
                    onChanged: (_) => taskViewModel.toggleTask(task.id),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      task.title,
                      style: TextStyle(
                        fontSize: 16,
                        decoration: task.isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                        color: task.isCompleted
                            ? Colors.grey
                            : Colors.black87,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Konfirmasi Hapus'),
                          content: Text('Apakah kamu yakin ingin menghapus "${task.title}"?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context), // Batal
                              child: const Text('Batal'),
                            ),
                            TextButton(
                              onPressed: () {
                                taskViewModel.deleteTask(task.id);
                                Navigator.pop(context); // Tutup dialog

                                // Tampilkan snackbar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('Tugas berhasil dihapus'),
                                    backgroundColor: Colors.green,
                                    duration: const Duration(seconds: 2),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              },
                              child: const Text(
                                'Hapus',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AddTaskScreen(
              onAdd: (title) => taskViewModel.addTask(title),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
