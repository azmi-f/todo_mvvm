import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function(String) onAdd;

  AddTaskScreen({required this.onAdd});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Tambah Tugas'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'Masukkan nama tugas'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Batal'),
        ),
        ElevatedButton(
          onPressed: () {
            final text = _controller.text;
            if (text.isNotEmpty) {
              onAdd(text);
              Navigator.pop(context);
            }
          },
          child: Text('Simpan'),
        ),
      ],
    );
  }
}
