import 'package:flutter/material.dart';
import 'assignment_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _subjects = [];

  void _addSubject() {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController controller = TextEditingController();
        return AlertDialog(
          title: const Text('Add New Subject'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter subject name'),
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
                    _subjects.add(controller.text.trim());
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
        title: const Text('Assignment Manager'),
        centerTitle: true,
      ),
      body: _subjects.isEmpty
          ? const Center(
              child: Text(
                'No subjects yet.\nTap + to add one!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _subjects.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(_subjects[index]),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                    onTap: () {
                      Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => AssignmentScreen(subjectName: _subjects[index]),
    ),
  );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addSubject,
        child: const Icon(Icons.add),
      ),
    );
  }
}
