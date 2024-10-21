import 'package:flutter/material.dart';
import 'notes.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const TextField(
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
              ),
                decoration: InputDecoration(
                  hintText: 'Type notes',
                  hintStyle: TextStyle(
                    color: Colors.white24,
                  ),
                ),
            ),
            const Spacer(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white10,
                ),
                child: const Text('Add',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const NotesPage()),
                  );
                }
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
