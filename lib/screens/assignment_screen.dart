import 'package:flutter/material.dart';
import 'files_screen.dart';


class AssignmentScreen extends StatefulWidget {
  final String subjectName;

  const AssignmentScreen({super.key, required this.subjectName});

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  final List<String> _assignments = [];

  void _addAssignment() {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController controller = TextEditingController();
        return AlertDialog(
          title: const Text('Add New Assignment'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter assignment name'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.text.trim().isNotEmpty) {
                  setState(() {
                    _assignments.add(controller.text.trim());
                  });
                }
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subjectName),
        centerTitle: true,
      ),
      body: _assignments.isEmpty
          ? const Center(
              child: Text(
                'No assignments yet.\nTap + to add one!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _assignments.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(_assignments[index]),
                    trailing: const Icon(Icons.folder_open_rounded),
                    onTap: () {
                      // TODO: navigate to question/solution page later
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addAssignment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
